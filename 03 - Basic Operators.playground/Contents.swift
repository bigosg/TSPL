

//=========================
//   Assignment Operator
//=========================
let b = 10
var a = 5
a = b
let (x, y) = (1, 2)

//==========================
//   Arithmetic Operators
//==========================

var APlusB = "hello " + "world"

// Remainder Operator
var AModB  = 9 % 4

// Floating-Point Remainder Calculations
8 % 2.5

// Increment and Decrement Operators
var i = 0
++i

// Unary Minus Operator
let three = 3
let minusThree = -three
let plusThree = -minusThree

// Unary Plus Operator
let minusSix = -6
let alsoMinusSix = +minusSix

//===================================
//   Compound Assignment Operators
//===================================
var compose = 1
compose += 2

//===================================
//       Comparision Operators
//===================================

1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "world"
if name == "world" {
   print("hello world")
} else {
    print("I'm sorry \(name), but I don't recoginze you")
}

//===================================
//   Ternary Conditional Operator
//===================================
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//===================================
//      Nil Coalescing Operator
//===================================

var konghe: String?
var kongnil = "test"
konghe != nil ? konghe! : kongnil

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName

//========================
//     Range Operators
//========================

// Closed Range Operator
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

// Half-Open Range Operator
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}

//========================
//   Logical Operators
//========================


// Logical NOT Operator
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

// Logical AND Operator
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

// Logical OR Operator
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

// Combining Logical Operator
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

// Explicit Parenteses
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
