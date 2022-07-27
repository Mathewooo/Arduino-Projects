import AVR

typealias IntegerLiteralType = UInt8

let buttonPin: Pin = D2
let buzzerPin: Pin = D11
let readsPerSecond: Milliseconds = 25

pinMode(pin: buzzerPin, mode: OUTPUT)
digitalWrite(pin: buttonPin, value: HIGH)

let validSetup: Bool = (readsPerSecond != 0)

while (validSetup) {
    if !digitalRead(pin: buttonPin) {
        repeat {
            digitalWrite(pin: buzzerPin, value: HIGH)
            delay(milliseconds: 400)
            digitalWrite(pin: buzzerPin, value: LOW)
            delay(milliseconds: 20)
        } while (!digitalRead(pin: buttonPin))
    } else { digitalWrite(pin: buzzerPin, value: LOW) }
    delay(milliseconds: 1000 / readsPerSecond)
}