import AVR

typealias IntegerLiteralType = UInt8

let redPin: Pin = D3
let greenPin: Pin = D5
let bluePin: Pin = D6
let delayTime: Milliseconds = 1

SetupSerial()
pinMode(pin: redPin, mode: OUTPUT)
pinMode(pin: greenPin, mode: OUTPUT)
pinMode(pin: bluePin, mode: OUTPUT)
digitalWrite(pin: redPin, value: HIGH)
digitalWrite(pin: greenPin, value: LOW)
digitalWrite(pin: bluePin, value: LOW)

var redValue: UInt8 = 255
var greenValue: UInt8 = 0
var blueValue: UInt8 = 0

func revamp() {
    redValue = 0
    greenValue = 0
    blueValue = 0
}

func rgb(_ value1: UInt8,_ value2: UInt8,_ pin1: Pin,_ pin2: Pin) {
    var firstValue = (value1 == 255 ? value1 : 255)
    var secondValue = value2
    for _ in 1...255 {
        firstValue -= 1
        secondValue += 1
        analogWrite(pin: pin1, value: firstValue)
        analogWrite(pin: pin2, value: secondValue)
        delay(milliseconds: delayTime)
    }
    revamp()
}

while(true) {
    rgb(redValue, greenValue, redPin, greenPin)
    rgb(greenValue, blueValue, greenPin, bluePin)
    rgb(blueValue, redValue, bluePin, redPin)
}
