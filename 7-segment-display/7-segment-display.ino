#include <SevSeg.h>
SevSeg sevseg;

void setup() {
  byte numDigits = 1;
  byte digitPins[] = {};
  byte segmentPins[] = {3, 2, 8, 7, 6, 4, 5, 9};
  bool resistorsOnSegments = true;
  sevseg.begin(COMMON_CATHODE, numDigits, digitPins, segmentPins, resistorsOnSegments);
  sevseg.setBrightness(90);
}

void loop() { 
   for(int index = 0; index < 10; index++) {
     sevseg.setNumber(index);
     sevseg.refreshDisplay(); 
     delay(500);
   }
}
