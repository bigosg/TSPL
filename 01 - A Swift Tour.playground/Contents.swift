
var str = "Hello, playground"
print(str)
print("Hello world!")

//===========================
//       Simple Values
//===========================

var myVariable = 42
myVariable = 50
let myConstant = 42

let myIntConstant = 50

let myImplicitDoubleConstant = 50.0

let myExplicitDoubleConstant:Double = 50.00

let mFloatConstant:Float = 50.000

let mExFloatConstant:Float = 4

let label = "The width is "
let width = 95
let widthLabel = label + String(width)

// let widthLabel1 = label + width

let apples = 3
let orange = 5
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + orange) pieces of fruit."


// Array
var shoppingList = ["apple","food","vagetable"]
shoppingList[1] = "pig"
print(shoppingList)

// Dictionary
var occupation = [
  "1": 1,
  "2": 2,
]
occupation["2"] = 3
print(occupation)

let emptyArray = [String]() // empty
let emptyDictionary = [String: Double]() // empty
shoppingList = []
occupation = [:]

print(shoppingList)
print(occupation)

//===========================
//       Control Flow
//===========================

// Use if and switch to make conditionals, and use for-in, for, while, and repeat-while to make loops

// if
let individualScores = [1,2,4,8,11]
var teamScore = 0
for score in individualScores {
    if score > 4 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optionalString: String? = "hello"
print(optionalString == nil)

var optionalName: String? = "john"
var greeting = "hello!"

if let name = optionalName {
    greeting = "Hello \(name)"
} else {
    let nameTemp = "ffff"
    greeting = "hello \(nameTemp)"
}

let nickName: String? = nil
let fullName: String = "John More"
let informalGreeting = "Hi \(nickName ?? fullName)"

//swith
let vegetable = "red pepper"
switch vegetable {
case "celery" :
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

// for
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var sum = 0
var type: String?
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            sum += number
            type = kind
        }
    }
}

print(largest)
sum
type

// while
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

// for
var firstLoop = 0
for i in 0..<4 {
    firstLoop += i
}
print(firstLoop)

var secondLoop = 0
for var i = 0; i < 4;  i++ {
    secondLoop  += i
}
print(secondLoop)


//===============================
//     Functions and Closures
//===============================
func greet(name: String, eatWhat: String) -> String {
    return "Hello \(name), We eat \(eatWhat) today ."
}
greet("Bob", eatWhat: "vegetable")

// tuple return
func caculateStatisics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum  += score
    }
    return (min, max, sum)
}

let statistics = caculateStatisics([5, 4, 7, 13, 44, 68])
print(statistics.min)
print(statistics.max)
print(statistics.sum)
print(statistics.1)

// Functions can also take a variable number of arguments,collecting them into an array
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

sumOf()
sumOf(123,432, 16)

// Expriment: Write a function that calculates the average of its arguments.
func avgParam (numbers: Int...) ->Int {
    var avg = 0
    for number in numbers {
        avg  += number
    }
     avg = avg / numbers .count
    return avg
}
avgParam(0)
avgParam(4,90,100)

// Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.
func returnFifteen() ->Int {
    var y = 10
    func add () {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// Functions are a first-class type. This means that a function can return another function as its value.
func makeInCrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeInCrementer()
increment(7)
print(makeInCrementer()(7))

// A function can take another function as one of its arguments.
func hasAnyMatches(list:[Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number:Int) -> Bool {
    return number < 10
}

var numbers = [20, 7, 19, 12]
hasAnyMatches(numbers, condition: lessThanTen)

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

let sortedNumbers = numbers.sort { $0 > $1 }
print(sortedNumbers)

//=========================
//   Objects and Classes
//=========================
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription  = shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "\(self.name) shape with \(numberOfSides) sides"
    }
}

var namedShape = NamedShape.init(name: "Tom")
namedShape.numberOfSides = 7
var namedShapeDescription  = namedShape.simpleDescription()

class Square: NamedShape {
    var sideLength: Double
    
    init(sizeLength: Double, name: String) {
        self.sideLength = sizeLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "\(self.name) with side of  length \(sideLength)."
    }
}

let test = Square(sizeLength: 5.2, name: "my square")
test.area()
test.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        
        set (customNewValue){
            sideLength = customNewValue / 3.0
        }
        
//        set {
//            sideLength = newValue / 3.0
//        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sizeLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sizeLength: 50, name: "large square")
print(triangleAndSquare.triangle.sideLength)
let optionalSquare: Square? = Square(sizeLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

//=================================
//   Enumerations and Structures
//=================================
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ACE"
        case .Jack:
            return "Jack"
        case .Queen:
            return "Queen"
        case .King:
            return "King"
        default:
            return String(self.rawValue)
        }
    }
}

// the raw-value type of the enumeration is Int, so you only have to specify the first raw value. By default, Swift assgins the raw values Staring at zero and incrementing by one each time, The rest of the raw values are assigned in order. You can also use strings or floating-point numbers as the raw type of an enumeration.
let ace = Rank.Ace
let aceRawValue = ace.rawValue
let jack = Rank.Jack
let jackRawValue = jack.rawValue

// Use the init?(rawValue:) initializer to make an instance of an enumeration from a raw value.
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

// The case values of an enumeration are actual values, not just another way of writing their raw values. In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case Suit.Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    
    //  EXPERIMENT: Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
    func color() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        }
    }
}

// Notice the two ways that the Hearts case of the enumeration is referred to above: When assigning a value to the hearts constant, the enumeration case Suit.Hearts is referred to by its full name because the constant doesn’t have an explicit type specified. Inside the switch, the enumeration case is referred to by the abbreviated form .Hearts because the value of self is already known to be a suit. You can use the abbreviated form anytime the value’s type is already known.

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()


// Use struct to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:009 pm")
let error = ServerResponse.Error("Out of cheese")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at\(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}

//================================
//    Protocol and Extensions
//================================
protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol{
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// EXPERIMENT：Write an enumeration that conforms to this protocol.

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

// EXPERIMENT：Write an extension for the Double type that adds an absoluteValue property.
extension Double {
    var absoluteValueDescription: String {
        return "The number \(self)"
    }
    
    mutating func absolute() {
        if (self < 0) {
            self = -self
        }
    }
}
var doub = Double(-6.7)
doub.absolute()
print(doub.absoluteValueDescription)
var doub2 = Double(3.7)
doub2.absolute()
print(doub2.absoluteValueDescription)

//==============
//   Generics
//==============

func repeatItem<Item>(item:Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
repeatItem("Knock", numberOfTimes: 4)

enum OptionalValue<Wrapped> {
    case NONE
    case Some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .NONE
possibleInteger = .Some(100)

func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element:Equatable, T.Generator.Element == U.Generator.Element> (lhs:T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([1, 2, 3], [3])

//====================
//   Error Handling
//====================
enum PrintError: ErrorType {
    case OutOfPaper
    case NoToner
    case Onfire
}

func sendToPrinter(printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrintError.NoToner
    }
    return "Job sent"
}

do {
    let printerResponse = try sendToPrinter("Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try sendToPrinter("Gutenberg")
    print(printerResponse)
} catch  PrintError.Onfire {
    print("I'll just put this over here, with the rest of fire.")
} catch let printerError as PrintError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

let printerSuccess = try? sendToPrinter("Mergenthaler")
let printerFailure = try? sendToPrinter("Never Has Toner")

var teaKettleHeating = false
func morningRoutine() throws {
    teaKettleHeating = true
    defer {
        teaKettleHeating = false
    }
    
    _ = try sendToPrinter("lanston")
}







