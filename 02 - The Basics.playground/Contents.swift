
//=============================
//   Constants and Varuables
//=============================

// Declaring Constants and Variables
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

// Type Annotations
var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double

// Naming Constants and Variables
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

var languageName = "Swift"
languageName = "Swift++"

// priting Constants and Variables
print(languageName)


//==============
//   Comments
//==============
// 这是一个注释

/* 这是一个,
多行注释 */

/* 这是第一个多行注释的开头
/* 这是第二个被嵌套的多行注释 */
这是第一个多行注释的结尾 */
print("The current value of friendlyWelcome is \(languageName)")


//================
//   Semicolons
//================
let cat = "🐱"; print(cat)
// 输出 "🐱"


//================
//    Integers
//================

// Integer Bounds
let minValue = UInt8.min
let maxValue = UInt8.max

let UIntMaxValue = UInt.max
let UInt32MaxValue = UInt32.max
let UInt64MaxValue = UInt64.max
let IntMaxValue = Int.max
let IntMinValue = Int.min


//============================
//   Floating-Point Numbers
//============================

// Type Safety and Type Inference
let meaningOfLife = 42

let pi = 3.14159 // Double
let anotherPi = 3 + 0.14159 // Double


//============================
//      Numeric Literals
//============================
let decimalInteger = 17 // decimal
let binaryInteger = 0b10001 // binary
let octalInteger = 0o21 //  octal
let hexadecimalInteger = 0x11 // hexadecimal

let floatExp = 1.25e2
let floatExp2 = 1.25E-2

let hexadecimalFloatExp = 0xfp2 // 15 × 2^2
let hexadecimalFloatExp2 = 0xfP-2 // 15 × 2^-2


let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble1 = 0xC.3p1 // 
let hexadecimalDouble2 = (12 + 3 / 16.0) * 2


let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//=============================
//   Numeric Type Conversion
//=============================

// Integer Conversion

// let cannotBeNegative: UInt8 = 1
// let tooBig: Int8 = Int8.max + 1

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// Integer and Floating-Point Conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pii = Double(three) + pointOneFourOneFiveNine

let intgerPi = Int(pii) // truncate


//=============================
//       Type Aliases
//=============================
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

//=============================
//           Booleans
//=============================
let orangeAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips")
} else {
    print("Ewwm turnips are horrible")
}

//=============================
//           Tuples
//=============================

let http404Error = (404, "Not Found") // （Int, String)

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)") // decompose
print("The status message is Not Found")

// If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

// access the individual element values in a tuple using index numbers starting at zero
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")

// Tuples are particularly useful as the return values of functions. A function that tries to retrieve a web page might return the (Int, String) tuple type to describe the success or failure of the page retrieval. By returning a tuple with two distinct values, each of a different type, the function provides more useful information about its outcome than if it could only return a single value of a single type. For more information, see Functions with Multiple Return Values.
print("The status code is \(http200Status.statusCode)")
print("The staus message is \(http200Status.description)")


//===============
//   Optionals
//===============

let possibleNumber = "123"

// the initializer might fail, it returns an optional Int, rather than an Int. An optional Int is written as Int?, not Int. The question mark indicates that the value it contains is optional, meaning that it might contain some Int value, or it might contain no value at all. (It can’t contain anything else, such as a Bool value or a String value. It’s either an Int, or it’s nothing at all.)
let convertedNumber = Int(possibleNumber)


// nil
var serverResponseCode: Int? = 404
serverResponseCode = nil

// Swift’s nil is not the same as nil in Objective-C. In Objective-C, nil is a pointer to a nonexistent object. In Swift, nil is not a pointer—it is the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types.

var surveyAnswer: String? // surveyAnswer 被自动设置为nil

// if statements and Forced Unwrapping

if convertedNumber != nil {
    print("convertedNumber contains some integer value")
}

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)") // Trying to use ! to access a non-existent optional value triggers a runtime error. Always make sure that an optional contains a non-nil value before using ! to force-unwrap its value. (可选值的强制解析)
}

// Optional Binding (可选绑定)
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
     print("\'\(possibleNumber)\' could not be converted to an integer")
}

if let firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}

// Implicitly Unwrapped Optionals (隐式解析可选类型)
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumeString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumeString

if assumeString != nil {
    print(assumeString)
}

if let definiteString = assumeString {
    print(definiteString)
}

//====================
//   Error Handling
//====================

func canThrowAnError() throws {
    
}

do {
    try canThrowAnError()
        
}   catch {
        
}

//================
//   Assertions
//================
let age = 9
assert(age >= 0, "A person's age cannot be less than zero")
assert(age >= 0)
