import AVR

typealias IntegerLiteralType = UInt8

let buttonPin: Pin = D2
let ledPin: Pin = D11
let readsPerSecond: Milliseconds = 10

pinMode(pin: ledPin, mode: OUTPUT)
digitalWrite(pin: buttonPin, value: HIGH)

let validSetup: Bool = (readsPerSecond != 0)

while(validSetup) {
    if digitalRead(pin: buttonPin) { digitalWrite(pin: ledPin, value: LOW) } 
    else { digitalWrite(pin: ledPin, value: HIGH) }
    delay(milliseconds: 1000 / readsPerSecond)
}
