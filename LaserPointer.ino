//TODO: stepper code, laser code, button code
//Test with servos?

#define DEBUG

#include <Servo.h>

Servo servo_yaw;
Servo servo_pitch;

int index = 0;

double US = 0.0;
double SLR = 0.0;
double HEIGHT = 48.0; //Laser height, in INCHES
double lastT1 = 0.0;
double lastT2 = 0.0;

double stepsPerDegree = 11.3;

String usValues[] = {"4'2", "6'9", "1'0","15'10.25", "30'11.75", "25'0", "3'0"};
String slrValues[] = {"8'11.5", "-6'0","22'3","0'5","-22'0", "-10'5", "-25'2"};

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
Serial.println("Starting up");
#ifdef DEBUG
Serial.println("DEBUG ENABLED");
#endif

servo_yaw.attach(9);
servo_pitch.attach(6);
servo_yaw.write(90);
servo_pitch.write(90);
delay(5000);
}

void loop() {
  // put your main code here, to run repeatedly:
US = getInchesFromString(usValues[index]);
SLR = getInchesFromString(slrValues[index]);

#ifdef DEBUG
Serial.println("Index: ");
Serial.println(index);
Serial.println("US: ");
Serial.println(US);
Serial.println(usValues[index]);
Serial.println("SLR: ");
Serial.println(SLR);
Serial.println(slrValues[index]);
#endif

if(checkButton())
{
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
double deltaYaw = t1 - lastT1; //how many degrees to move
double deltaPitch = t2 - lastT2;

int yawSteps = deltaYaw/stepsPerDegree;
int pitchSteps = deltaPitch/stepsPerDegree;

//for(int i=0;i<(t1+90);i++)
//{
servo_yaw.write(t1+90);
delay(150);
//}
//for(int i=0;i<(t2+90);i++)
//{
servo_pitch.write(t2);
delay(150);
//}

takeSteps(yawSteps);
takeSteps(pitchSteps);
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

void takeSteps(int steps)
{
 //TODO
}

boolean checkButton()
{
  return 1;
}

void laserOFF()
{
 //TODO
}

void laserON()
{
  //TODO
}
