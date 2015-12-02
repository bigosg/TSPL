
//=======================================================
//                  Bitwise Operators
//=======================================================

func bitsToString(var number: UInt8) -> String {
    var bitString = ""
    for i in 0..<8 {
        if (number & UInt8(1)) == 1 {
            bitString = "1" + bitString
        } else {
            bitString = "0" + bitString
        }
        number = number >> 1
    }
    
    return bitString
}


// Bitwise NOT Operator - inverts all incoming bits
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits

bitsToString(initialBits)
bitsToString(invertedBits)

// Bitwise AND Operator - final bit equals 1 if both incoming bits equal 1
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits

bitsToString(middleFourBits)

// Bitwise OR Operator - final bit equals 1 if either incoming bit equals 1
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits
bitsToString(combinedbits)

// Bitwise XOR Operator - final bit equals 1 if incoming bits are different
let firstXORBits: UInt8 = 0b00010100
let otherXORBits: UInt8 = 0b00000101
let outputXORBits: UInt8 = firstXORBits ^ otherXORBits
bitsToString(outputXORBits)

// Bitwise Left and Right Shift Operators
let shiftBits: UInt8  = 4
shiftBits << 1
shiftBits << 2
shiftBits << 5
shiftBits << 6
shiftBits >> 2

let pink: UInt32  = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16
let greenComponent = (pink & 0x00ff00) >> 8
let blueComponent = (pink & 0x0000ff)

//=======================================================
//                  Overflow Operators
//=======================================================

// Overflow protection
var potentialOverflow = Int16.max
//potentialOverflow += 1 // throws overflow error

// Value overflow
var unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &+ 1

var unsignedUnderflow = UInt8.min
unsignedUnderflow = unsignedUnderflow &- 1


//=======================================================
//             Precedence and Associativity
//=======================================================

// Same rules as most languages...when in doubt, add parentheses
2 + 3 * 4 % 5
2 + ((3 * 4) % 5)


//=======================================================
//                Operator Functions
//=======================================================

// Custom arithmetic addition operator
struct Vector2D {
    var x = 0.0, y = 0.0
}
func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

// Prefix and Postfix Operators
prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: vector.y)
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative

// Compound Assignment Operators
func += (inout left: Vector2D, right: Vector2D) {
    left = left + right
}
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

prefix func ++ (inout vector: Vector2D) -> Vector2D {
    vector += Vector2D(x: 1.0, y: 1.0)
    return vector
}

var toIncrement = Vector2D(x: 3.0, y: 4.0)
let afterIncrement = ++toIncrement

// Equivalence Operators
func == (left: Vector2D, right: Vector2D) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
}

func != (left: Vector2D, right: Vector2D) -> Bool {
    return !(left == right)
}
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

//=======================================================
//                  Custom Operators
//=======================================================

prefix operator +++ {}

prefix func +++(inout vector: Vector2D) -> Vector2D {
    vector += vector
    return vector
}
var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled

// Precedence and Associativity for Custom Infix Operators
infix operator +- { associativity left precedence 140}
func  +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector






















