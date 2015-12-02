
var str = "Hello, playground"
print(str)

//===========================
//       Simple Values
//===========================

let myIntConstant = 50

let myImplicitDoubleConstant = 50.0

let myExplicitDoubleConstant:Double = 50.00

let mFloatConstant:Float = 50.000

let label = "The width is "
let width = 95
let widthLabel = label + String(width)

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

// if condition
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
optionalString == nil

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

//swith condition
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
for var i = 0; i < 4; ++i {
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

// tuple
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
avgParam(4,90)

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

// TODO: 重写闭包，对所有奇数返回0。

//有很多种创建更简洁的闭包的方法。如果一个闭包的类型已知，比如作为一个回调函数，你可以忽略参数的类型和返回值。单个语句闭包会把它语句的值当做结果返回。
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
        //在perimeter的 setter 中，新值的名字是newValue。你可以在set之后显式的设置一个名字。
        set {
            sideLength = newValue * 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

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

// 在上面的例子中，枚举原始值的类型是Int，所以你只需要设置第一个原始值。剩下的原始值会按照顺序赋值。你也可以使用字符串或者浮点数作为枚举的原始值。使用rawValue属性来访问一个枚举成员的原始值。
let ace = Rank.Ace
let aceRawValue = ace.rawValue

// 使用init?(rawValue:)初始化构造器在原始值和枚举值之间进行转换。
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

// 枚举的成员值是实际值，并不是原始值的另一种表达方法。实际上，以防原始值没有意义，你不需要设置。
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
    
    // 注意，有两种方式可以引用Hearts成员：给hearts常量赋值时，枚举成员Suit.Hearts需要用全名来引用，因为常量没有显式指定类型。在switch里，枚举成员使用缩写.Hearts来引用，因为self的值已经知道是一个suit。已知变量类型的情况下你可以使用缩写。
    func color() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

// 使用struct来创建一个结构体。结构体和类有很多相同的地方，比如方法和构造器。它们之间最大的一个区别就是结构体是传值，类是传引用。
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

/****** 协议和扩展 ******/
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

// 练习： 写一个实现这个协议的枚举。

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

// 练习： 给Double类型写一个扩展，添加absoluteValue功能。
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

/****** 泛型 ******/
//在尖括号里写一个名字来创建一个泛型函数或者类型。
func repeatItem<Item>(item:Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
repeatItem("Knock", numberOfTimes: 4)

// 你也可以创建泛型函数、方法、类、枚举和结构体。
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