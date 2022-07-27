import AVR

typealias IntegerLiteralType = UInt8

let analogPin: Pin = A0
let ledPin: Pin = D11
let readsPerSecond: Milliseconds = 30
var currentAnalogValue: UInt8 = 0

pinMode(pin: ledPin, mode: OUTPUT)
SetupSerial()
delay(milliseconds: 250)

let validSetup: Bool = (readsPerSecond != 0)

while(validSetup) {
    analogReadAsync(pin: analogPin) { value in
        currentAnalogValue = UInt8(value / 4)
        analogWrite(pin: ledPin, value: currentAnalogValue)
    }
    delay(milliseconds: 1000 / readsPerSecond)
}