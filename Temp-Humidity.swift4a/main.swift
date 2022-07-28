import AVR

typealias IntegerLiteralType = UInt8

SetupSerial()
let sensorPin: Pin = 7
var reading: (temperature: Int8, humidity: Int8, isValid: Bool)

while(true) {
    reading = readValues(pin: sensorPin)
    print("Temperature:")
    print(unsignedTinyInt: UInt8(reading.0))
    print("Humidity:")
    print(unsignedTinyInt: UInt8(reading.1))
    delay(milliseconds: 1000)
}
