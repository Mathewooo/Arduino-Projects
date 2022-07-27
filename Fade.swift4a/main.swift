import AVR

typealias IntegerLiteralType = UInt8

let ledPin: Pin = D11

let fadesPerSecond: Milliseconds = 60
let fadeOnStep: Int16 = 7
let fadeOffStep: Int16 = 5
let minBrightness: Int16 = 0
let maxBrightness: Int16 = 255

var currentBrightness: Int16 = minBrightness
var currentBrightnessOffset: Int16 = fadeOnStep

pinMode(pin: ledPin, mode: OUTPUT)

let validSetup: Bool = (fadesPerSecond != 0)

while(validSetup) {
    analogWrite(pin: ledPin, value: UInt8(currentBrightness))
    currentBrightness = currentBrightness + currentBrightnessOffset
    if (currentBrightness <= minBrightness) {
        currentBrightness = minBrightness
        currentBrightnessOffset = fadeOnStep
    } else if (currentBrightness >= maxBrightness) {
        currentBrightness = maxBrightness
        currentBrightnessOffset = -fadeOffStep
    }
    delay(milliseconds: 1000 / fadesPerSecond)
}
