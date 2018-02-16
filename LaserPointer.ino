//TODO: stepper code, laser code, button code
//Test with servos?

#define DEBUG
#define USING_SD

#include <IRL_Decode.h>
#include <IRL_Hash.h>
#include <IRL_Keycodes.h>
#include <IRL_Nec.h>
#include <IRL_NecAPI.h>
#include <IRL_Panasonic.h>
#include <IRL_Protocol.h>
#include <IRL_Receive.h>
#include <IRL_Time.h>
#include <IRLremote.h>

#include <ShiftedLCD.h>
#include <SPI.h>
#include <SdFat.h>
#include <CSVFile.h>
#include <CheapStepper.h>


#define PIN_SPI_CLK 13
#define PIN_SPI_MOSI 11
#define PIN_SPI_MISO 12

#define LASERPIN A5
#define BUTTONPIN A4

int index = 0;

//Create Steppers
double stepsPerDegree = 11.3;
CheapStepper stepper_yaw(3,4,5,6);
CheapStepper stepper_pitch(7,8,9,10);

//IR Sensor
#define IRPIN 2
CHashIR Remote;

//Math globals
double US = 0.0;
double SLR = 0.0;
double HEIGHT = 36.0; //Laser height, in INCHES
double lastT1 = 0.0;
double lastT2 = 0.0;

//Button globals
bool buttonStatus = false;
bool lastButtonStatus = false;

String usValues[] = {"4'2", "6'9", "1'0","15'10.25", "30'11.75", "25'0", "3'0"};
String slrValues[] = {"8'11.5", "-6'0","22'3","0'5","-22'0", "-10'5", "-25'2"};

String usValue = "";
String slrValue = "";

//SD Card
SdFat sd;
CSVFile csv;
#define SD_SELECT A1
const byte CSV_BUFFER_SIZE = 10;

//LCD info
#define LCD_SELECT A0
LiquidCrystal lcd(LCD_SELECT);
String lcdLine1 = "Self Test";
String lcdLine2 = "Waiting";


void setup() {
// put your setup code here, to run once:
Serial.begin(9600);
Serial.println("Starting up");

pinMode(PIN_SPI_MOSI, OUTPUT);
pinMode(PIN_SPI_MISO, INPUT);
pinMode(PIN_SPI_CLK, OUTPUT);

//Prep SPI SS Pins
pinMode(SD_SELECT, OUTPUT);
digitalWrite(SD_SELECT, HIGH);
pinMode(LCD_SELECT, OUTPUT);
digitalWrite(LCD_SELECT, HIGH);

lcd.begin(16,2);
lcd.clear();
lcd.print("Starting up");

Remote.begin(IRPIN);

#ifdef USING_SD
if(!sd.begin(SD_SELECT))// Initialize SD card
  {
    Serial.println("Error opening SD Card");
    lcd.clear();
    lcd.print("Error opening SD Card");
  }
else
{
    Serial.println("SD Card Opened");
    lcd.clear();
    lcd.print("SD Card Opened");
}
    
    // Important note!
    // You should use flag O_RDWR even if you use CSV File
    // only for writting.
 
if(!csv.open("coords.csv", O_RDWR | O_CREAT))// Initialize SD card
  {
    Serial.println("Error opening File");
    lcd.clear();
    lcd.print("Error opening File");
//    return;
  }
else
{
    Serial.println("File Opened");
    lcd.clear();
    lcd.print("File Opened");
}   

csv.gotoBeginOfFile();
#endif

#ifdef DEBUG
Serial.println("DEBUG ENABLED");
#endif


//Setup Laser, Button
pinMode(LASERPIN, OUTPUT);
pinMode(BUTTONPIN, INPUT_PULLUP);

stepper_yaw.setRpm(14);
stepper_pitch.setRpm(14);
stepper_yaw.set4076StepMode();
stepper_pitch.set4076StepMode();

#ifdef DEBUG
Serial.println("Moving test");
#endif

#ifndef DEBUG
point(90.0,0.0);
//delay(1500);
point(-90.0,0.0);
//delay(1500);
point(0.0,0.0);
//delay(1500);
point(0.0,90.0);
//delay(1500);
point(0.0,0.0);
#endif
updateLCD();

}

////////////////////////////////////
//LOOP
///////////////////////////////////

void loop() {
  // put your main code here, to run repeatedly:


buttonStatus = !checkButton(); //invert for pullup

//if (Remote.available())
//{
//    // Get the new data from the remote
//    auto data = Remote.read();
//
//    // Print the protocol data
//    Serial.print(F("Address: 0x"));
//    Serial.println(data.address, HEX);
//    Serial.print(F("Command: 0x"));
//    Serial.println(data.command, HEX);
//    Serial.println();
//    Serial.println("=====================");
//}

if((buttonStatus == true && buttonStatus != lastButtonStatus) || Remote.available())
{ 
  auto data = Remote.read();
  #ifdef USING_SD
  switch(data.command){
  
  case 0xF5603691: //NEXT - Apple Remote
  if(getNextValuesFromCard())
  {
  lcdLine1 = usValue + "," + slrValue;
  
  US = getInchesFromString(usValue);
  SLR = getInchesFromString(slrValue);

    lase(US,SLR);
  }
  break;
  
  case 0x41F5B3D1: //PREV - Apple Remote
    if(getPrevValuesFromCard())
  {
  lcdLine1 = usValue + "," + slrValue;
  
  US = getInchesFromString(usValue);
  SLR = getInchesFromString(slrValue);

    lase(US,SLR);
  }
  break;
  }
  #else
  usValue = usValues[index];
  slrValue = slrValues[index];
  index++;
  if(index > 6)
  {
    index = 0;
  }
    lcdLine1 = usValue + "," + slrValue;
  
  US = getInchesFromString(usValue);
  SLR = getInchesFromString(slrValue);

    lase(US,SLR);
  #endif

    updateLCD();
    //delay(2000);
   }

}


void lase(double US, double SLR)
{
  laserOFF();
  //Calculate the angles
  double floorHyp = sqrt((US*US) + (SLR*SLR)); //floor hypotenuse
  double theta1 = (atan2(SLR,US)*4068/71); //yaw
  double theta2 = (atan2(floorHyp, HEIGHT)*4068/71); //pitch
  
  #ifdef DEBUG
  Serial.println("theta1: ");
  Serial.println(theta1);
  Serial.println("theta2: ");
  Serial.println(theta2);
  #endif
  
  //Move the gimbal
  point(theta1, theta2);
  
  laserON();

}

void point(double t1, double t2)
{
  lcdLine2 = "Moving";

  double deltaYaw = t1 - lastT1; //how many degrees to move
  double deltaPitch = t2 - lastT2;

  #ifdef DEBUG
  Serial.print("Moving to: " + String(t1));
  Serial.println(" and " + String(t2));
  Serial.print("Delta of: " + String(deltaYaw));
  Serial.println(" and " + String(deltaPitch));  
  #endif
  
  int yawSteps = deltaYaw*stepsPerDegree;
  int pitchSteps = deltaPitch*stepsPerDegree;

  updateLCD();
  takeSteps(yawSteps, pitchSteps);
  lcdLine2 = "Done";
  lastT1 = t1;
  lastT2 = t2;
}

double getInchesFromString(String s)
{
   int tickLocation = 0;
   for(int i=0;i<s.length();i++)
   {
      if(s.charAt(i) == 39) //39 is the ' character
      {
        tickLocation = i;
        break;
      }
   }
   if(tickLocation == 0)
   {
      return 0.0; //Found nothing?
   }
  String footStr = s.substring(0,tickLocation);
  String inchStr = s.substring(tickLocation+1);
  
  float feet = footStr.toFloat();
  float inches = inchStr.toFloat();
  
  double total = (feet*12.0) + inches;
  
  /*
  #ifdef DEBUG
  Serial.println(footStr);
  Serial.println(inchStr);
  Serial.println("feet: ");
  Serial.println(feet);
  Serial.println("inches: ");
  Serial.println(inches);
  Serial.println("Total: ");
  Serial.println(total);
  #endif
  */
  
  return total;

}

void takeSteps(int yS, int pS)
{

  #ifdef DEBUG
  Serial.println();
  Serial.println("Yaw steps: " + String(yS));
  Serial.println("Pitch steps: " + String(pS)); 
  #endif

 
 if(yS >= 0)
 {
 stepper_yaw.newMove(true, abs(yS));
 }
 else
 {
 stepper_yaw.newMove(false, abs(yS));
 }
 if(pS >= 0)
 {
 stepper_pitch.newMove(true, abs(pS));
 }
 else
 {
 stepper_pitch.newMove(false, abs(pS));
 }

 while(stepper_yaw.getStepsLeft() != 0 || stepper_pitch.getStepsLeft() != 0)
 {
 if(!Remote.receiving()){
   stepper_yaw.run();
 stepper_pitch.run();
 }
 }
 delay(250);
 //hacky af to prevent overheating
 for(int i = 3; i<=10; i++)
 {
  digitalWrite(i, LOW);
 }
}

#ifdef USING_SD
bool getNextValuesFromCard()
{
  char buffer[CSV_BUFFER_SIZE+1];
  buffer[CSV_BUFFER_SIZE] = '\0';
if(csv.nextLine())
{
  if(csv.readField(buffer, CSV_BUFFER_SIZE))
  {
    usValue = String(buffer);
  }
  else
  {
    lcdLine1 = "US Read Fail";
    return false;
  }
  csv.nextField();
  if(csv.readField(buffer, CSV_BUFFER_SIZE))
  {
    slrValue = String(buffer);
  }
  else
  {
    lcdLine1 = "SL/R Read Fail";
    return false;
  }
}
else
{
  lcdLine1 = "End of File";
  return false;
}
lcdLine1 = "Read Successful";
return true;
}
#endif
#ifdef USING_SD
bool getPrevValuesFromCard()
{
  char buffer[CSV_BUFFER_SIZE+1];
  buffer[CSV_BUFFER_SIZE] = '\0';
  int prevLine = csv.getNumberOfLine()-1;
if(prevLine > 0)
{  
  if(csv.gotoLine(prevLine))
  {
    if(csv.readField(buffer, CSV_BUFFER_SIZE))
    {
      usValue = String(buffer);
    }
    else
    {
      lcdLine1 = "US Read Fail";
      return false;
    }
    csv.nextField();
    if(csv.readField(buffer, CSV_BUFFER_SIZE))
    {
      slrValue = String(buffer);
    }
    else
    {
      lcdLine1 = "SL/R Read Fail";
      return false;
    }
  }
}
else
{
  lcdLine1 = "Beginning of File";
  return false;
}
lcdLine1 = "Read Successful";
return true;
}
#endif

void updateLCD()
{
#ifdef DEBUG
Serial.println(lcdLine1);
Serial.println(lcdLine2);
Serial.println();
#endif
lcd.clear();
lcd.print(lcdLine1);
lcd.setCursor(0, 1);
lcd.print(lcdLine2);
}

boolean checkButton()
{
  return digitalRead(BUTTONPIN);
}

void laserOFF()
{
 digitalWrite(LASERPIN, 0);
}

void laserON()
{
  digitalWrite(LASERPIN, 1);
}

