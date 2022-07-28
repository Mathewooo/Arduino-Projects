#include <SevSeg.h>
SevSeg sevseg; 
const int buttonPin = 11; 
int buttonState = 0;         

void setup(){
   byte numDigits = 1;
   byte digitPins[] = {};
   byte segmentPins[] = {3, 2, 8, 7, 6, 4, 5, 9};
   bool resistorsOnSegments = true;
   sevseg.begin(COMMON_CATHODE, numDigits, digitPins, segmentPins, resistorsOnSegments);
   sevseg.setBrightness(90);
   pinMode(buttonPin, INPUT);
}

void loop() {
  buttonState = digitalRead(buttonPin);
  if (buttonState == HIGH) {
    sevseg.setNumber(random(0,9));
    sevseg.refreshDisplay(); 
  } 
}
