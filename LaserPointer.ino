

//TODO: stepper code, laser code, button code
//Test with servos?

#define DEBUG

#include <Servo.h>
#include <ShiftedLCD.h>
#include <SPI.h>
#include <SdFat.h>
#include <CSVFile.h>
#include <CheapStepper.h>

#define PIN_SPI_CLK 13
#define PIN_SPI_MOSI 11
#define PIN_SPI_MISO 12

#define LASERPIN 12
#define BUTTONPIN 2

//Create Servos or Steppers
Servo servo_yaw;
Servo servo_pitch;
double stepsPerDegree = 11.3;
CheapStepper stepper_yaw(2,3,4,5);
CheapStepper stepper_pitch(6,7,8,9);

int index = 0;

//Math globals
double US = 0.0;
double SLR = 0.0;
double HEIGHT = 48.0; //Laser height, in INCHES
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
#define SD_SELECT 10
const byte CSV_BUFFER_SIZE = 10;

//LCD info
#define LCD_SELECT A0
LiquidCrystal lcd(LCD_SELECT);
String lcdLine1 = "Setup Complete";
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

if(!sd.begin())// Initialize SD card
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
 
if(!csv.open("file.csv", O_RDWR | O_CREAT))// Initialize SD card
  {
    Serial.println("Error opening File");
    lcd.clear();
    lcd.print("Error opening File");
    return;
  }
else
{
    Serial.println("File Opened");
    lcd.clear();
    lcd.print("File Opened");
}   

csv.gotoBeginOfFile();

#ifdef DEBUG
Serial.println("DEBUG ENABLED");
#endif


//Setup Laser, Button
pinMode(LASERPIN, OUTPUT);
pinMode(BUTTONPIN, INPUT_PULLUP);

stepper_yaw.setRpm(12);
stepper_pitch.setRpm(12);
stepper_yaw.set4076StepMode();
stepper_pitch.set4076StepMode();
  
//servo_yaw.attach(9);
//servo_pitch.attach(6);
//servo_yaw.write(90);
//servo_pitch.write(90);

delay(1000);
}

////////////////////////////////////
//LOOP
///////////////////////////////////

void loop() {
  // put your main code here, to run repeatedly:
updateLCD();

buttonStatus = !checkButton(); //invert for pullup

if(buttonStatus == true && buttonStatus != lastButtonStatus)
{  
  getNextValuesFromCard();
  lcdLine1 = usValue + "," + slrValue;
  
  US = getInchesFromString(usValues[index]);
  SLR = getInchesFromString(slrValues[index]);
              //
              //    #ifdef DEBUG
              //    Serial.println("Index: ");
              //    Serial.println(index);
              //    Serial.println("US: ");
              //    Serial.println(US);
              //    Serial.println(usValues[index]);
              //    Serial.println("SLR: ");
              //    Serial.println(SLR);
              //    Serial.println(slrValues[index]);
              //    #endif


    lase(US,SLR);
     
    index++;
     if(index > 6)
      {
        index = 0;
       }
    #ifdef DEBUG
    Serial.println("---Loop End---");
    #endif
    delay(2000);
   }

}


void lase(double US, double SLR)
{
  laserOFF();
  //Calculate the angles
  double floorHyp = sqrt(square(US) + square(SLR)); //floor hypotenuse
  double theta1 = (atan2(SLR,US)*4068)/71; //yaw
  double theta2 = (atan2(floorHyp, HEIGHT)*4068)/71; //pitch
  
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
  
  int yawSteps = deltaYaw/stepsPerDegree;
  int pitchSteps = deltaPitch/stepsPerDegree;
//  
//  //for(int i=0;i<(t1+90);i++)
//  //{
//  servo_yaw.write(t1+90);
//  delay(150);
//  //}
//  //for(int i=0;i<(t2+90);i++)
//  //{
//  servo_pitch.write(t2);
//  delay(150);
//  //}
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
 bool yawDir = (yS >= 0);
 stepper_yaw.newMove(yawDir, yS);
 bool pitchDir = (pS >= 0);
 stepper_pitch.newMove(pitchDir, pS);
 while(stepper_yaw.getStepsLeft() > 0 && stepper_pitch.getStepsLeft() > 0)
 {
 stepper_yaw.run();
 stepper_pitch.run();
 }
}

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

void updateLCD()
{
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

