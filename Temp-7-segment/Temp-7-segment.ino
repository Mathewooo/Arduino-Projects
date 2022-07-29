#include <dht.h>
#include <SevSeg.h>
#define sensorPin 14
SevSeg sevseg;
dht DHT;  

void setup(){
  Serial.begin(9600);
  byte numDigits = 4;
  byte digitPins[] = {10, 11, 12, 13};
  byte segmentPins[] = {9, 2, 3, 5, 6, 8, 7, 4};
  bool resistorsOnSegments = true; 
  sevseg.begin(COMMON_ANODE, numDigits, digitPins, segmentPins, resistorsOnSegments);
  sevseg.setBrightness(90);
}

void loop() {
  unsigned long timer = millis();
  int readData = DHT.read11(sensorPin);
  float temperature = DHT.temperature * 100;
  while ((millis() - timer) < 2000) {
     sevseg.setNumber(temperature, 2);
     sevseg.refreshDisplay(); 
  }
}
