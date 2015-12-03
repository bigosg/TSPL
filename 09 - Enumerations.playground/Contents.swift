//=============
//   枚举语法
//=============
enum someEnumeration {
    // 枚举定义放在这里
}

/*
  与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的CompassPoint例子中，North，South，East和West不会被隐式地赋值为0，1，2和3。相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的CompassPoint类型。
 */
enum CompassPoint {
    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = CompassPoint.West

/*
  directionToHead的类型可以在它被CompassPoint的某个值初始化时推断出来。一旦directionToHead被声明为CompassPoint类型，你可以使用更简短的点语法将其设置为另一个CompassPoint的值
 */
directionToHead  = .West

//=============================
//   使用Switch 语句匹配枚举值
//=============================

/*
    正如在控制流（Control Flow）中介绍的那样，在判断一个枚举类型的值时，switch语句必须穷举所有情况。如果忽略了.West这种情况，上面那段代码将无法通过编译，因为它没有考虑到CompassPoint的全部成员。强制穷举确保了枚举成员不会被意外遗漏。

    当不需要匹配每个枚举成员的时候，你可以提供一个default分支来涵盖所有未明确处理的枚举成员
 */
directionToHead = .South
switch directionToHead {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out of penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

//===========
//   关联值
//===========

enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)

productBarcode = .QRCode("ABCDEFGHIJKLMNOP")


switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case .QRCode(let productCode):
    print("QR code: \(productCode).")
}
// 输出 "QR code: ABCDEFGHIJKLMNOP."

switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode(productCode):
    print("QR code: \(productCode).")
}
// 输出 "QR code: ABCDEFGHIJKLMNOP."

//===========
//   原始值
//===========

enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

// 原始值的隐式赋值
enum Planet2: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

enum CompassPoint1: String {
    case North, South, East, West
}

let earthOrder = Planet2.Earth.rawValue

let sunsetDirection = CompassPoint1.West.rawValue

// 使用原始值初始化枚举实例

/*
 如果在定义枚举类型的时候使用了原始值，那么将会自动获得一个初始化方法，这个方法接收一个叫做rawValue的参数，参数类型即为原始值类型，返回值则是枚举成员或nil。你可以使用这个初始化方法来创建一个新的枚举实例。

 这个例子利用原始值7创建了枚举成员Uranus
 */
let possiblePlanet = Planet2(rawValue: 7)


let positionToFind = 9
if let somePlanet = Planet2(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

//=============
//   递归枚举
//=============

/*
  递归枚举（recursive enumeration）是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上indirect来表示该成员可递归
 */

enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

/*
  上面定义的枚举类型可以存储三种算术表达式：纯数字、两个表达式相加、两个表达式相乘。枚举成员Addition和Multiplication的关联值也是算术表达式——这些关联值使得嵌套表达式成为可能。
 */
indirect enum ArithmeticExpression1 {
    case Number(Int)
    case Addition(ArithmeticExpression, ArithmeticExpression)
    case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))
