var str = "Hello, playground"

print(str)


/***** 简单值 *****/
//定义一个int常量
let myIntConstant = 50

//定义一个隐式double常量
let myImplicitDoubleConstant = 50.0

//定义一个显式double常量
let myExplicitDoubleConstant:Double = 50.00

//定义一个浮点类型
let mFloatConstant:Float = 50.000

let label = "The width is "
let width = 95
let widthLabel = label + String(width)

//数值类型转换成字符类型
let apples = 3
let orange = 5
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + orange) pieces of fruit."

// 数组
var shoppingList = ["apple","food","vagetable"]
shoppingList[1] = "pig"

print(shoppingList)

// 字典
var occupation = [
  "1": 1,
  "2": 2,
]
occupation["2"] = 3

print(occupation)

let emptyArray = [String]() // 空的数组
let emptyDictionary = [String: Double]() //空的字典
shoppingList = []
occupation = [:]

print(shoppingList)
print(occupation)


/***** 控制流 *****/

//if
let individualScores = [1,2,4,8,11]
var teamScore = 0
for score in individualScores {
    //在if语句中，条件必须是一个布尔表达式——这意味着像if score { ... }这样的代码将报错，而不会隐形地与 0 做对比。
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

//如果变量的可选值是nil，条件会判断为false，大括号中的代码会被跳过。如果不是nil，会将值赋给let后面的常量，这样代码块中就可以使用这个值了。
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
// 运行switch中匹配到的子句之后，程序会退出switch语句，并不会继续向下运行，所以不需要在每个子句结尾写break。
switch vegetable {
case "celery" :
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
// 注意let在上述例子的等式中是如何使用的，它将匹配等式的值赋给常量x。
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

//for
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print(largest)

//warning:TODO 练习： 添加另一个变量来记录现在和之前最大数字的类型。

//while
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

// 你可以在循环中使用..<来表示范围，也可以使用传统的写法 ,使用..<创建的范围不包含上界，如果想包含的话需要使用...
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

//函数和闭包
//使用func来声明一个函数，使用名字和参数来调用函数。使用->来指定函数返回值的类型。
func greet(name: String, eatWhat: String) -> String {
    return "Hello \(name), We eat \(eatWhat) today ."
}
greet("Bob", eatWhat: "vegetable")

//使用元组来让一个函数返回多个值。该元组的元素可以用名称或数字来表示。
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

//函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

sumOf()
sumOf(123,432, 16)

//练习： 写一个计算参数平均值的函数。
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

//函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
func returnFifteen() ->Int {
    var y = 10
    func add () {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
func makeInCrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var  increment = makeInCrementer()
increment(7)

//函数也可以当做参数传入另一个函数。
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

//重写闭包，对所有奇数返回0。

//有很多种创建更简洁的闭包的方法。如果一个闭包的类型已知，比如作为一个回调函数，你可以忽略参数的类型和返回值。单个语句闭包会把它语句的值当做结果返回。
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

let sortedNumbers = numbers.sort { $0 > $1 }
print(sortedNumbers)

// 对象和类
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
    
    //如果你需要在删除对象之前进行一些清理工作，使用deinit创建一个析构函数。
    
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

// 枚举和结构体
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