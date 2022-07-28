#include <Wire.h> 
#include <LiquidCrystal_I2C.h>
#include <dht.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);
#define sensorPin 7
dht DHT;

void setup() {
  lcd.begin();
  lcd.backlight();
}

void draw(boolean temperature) {
  if (temperature) {
    lcd.print("Teplota:");
    lcd.print(DHT.temperature);
    lcd.print((char) 223);
    lcd.print("C");
  } else {
    lcd.setCursor (0,1); 
    lcd.print("Vhlkost':");
    lcd.print(DHT.humidity);
    lcd.print("%");
  }
}

void loop() {
  int sensor = DHT.read11(sensorPin);
  lcd.clear();
  draw(true);
  draw(false);
  delay(1000);
}
