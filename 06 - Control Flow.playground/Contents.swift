//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/****** For 循环 ******/

/*
    Swift 提供两种for循环形式以来按照指定的次数多次执行一系列语句：
    for-in循环对一个集合里面的每个元素执行一系列语句。
    for 循环，用来重复执行一系列语句直到达成特定条件达成，一般通过在每次循环完成后增加计数器的值来实现。
 */

// For-In
for index in 1...5 {
    print(("\(index) times 5 is \(index * 5)"))
}

let base = 3
let power = 10
var answer = 1
// 如果你不需要知道区间序列内每一项的值，你可以使用下划线（_）替代变量名来忽略对值的访问
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names {
    print("Hello, \(name)!")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// For
for var index = 0; index < 3; ++index {
    print("index is \(index)")
}

/*
  循环首次启动时，初始化表达式（ initialization expression ）被调用一次，用来初始化循环所需的所有常量和变量。
  条件表达式（condition expression）被调用，如果表达式调用结果为false，循环结束，继续执行for循环关闭大括号（}）之后的代码。如果表达式调用结果为true，则会执行大括号内部的代码。
  执行所有语句之后，执行递增表达式（increment expression）。通常会增加或减少计数器的值，或者根据语句输出来修改某一个初始化的变量。当递增表达式运行完成后，重复执行第 2 步，条件表达式会再次执行。
 */

var index: Int
for index = 0; index < 3; ++index {
    print("index is \(index)")
}

print("The loop statements were executed \(index) times")

/****** while 循环 ******/

/*
while循环运行一系列语句直到条件变成false。这类循环适合使用在第一次迭代前迭代次数未知的情况下。Swift 提供两种while循环形式：

    while循环，每次在循环开始时计算条件是否符合；
    repeat-while循环，每次在循环结束时计算条件是否符合。
 */

//let finalSquare = 25
//var board = [Int](count: finalSquare + 1, repeatedValue: 0)
//board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
//board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//
//var square = 0
//var diceRoll = 0
//while square < finalSquare {
//    if ++diceRoll == 7 {diceRoll = 1}
//    square += diceRoll
//    if square < board.count {
//        square += board[square]
//    }
//}
//print("Game over")

// Repeat-While
/*
while循环的另外一种形式是repeat-while，它和while的区别是在判断循环条件之前，先执行一次循环的代码块，然后重复循环直到条件为false。

    注意： Swift语言的repeat-while循环合其他语言中的do-while循环是类似的。

    repeat {
        statements
    } while condition
 */
//repeat {
//    square += board[square]
//    if ++diceRoll == 7 {diceRoll = 1}
//    square += diceRoll
//} while square < finalSquare
//
//print("Game over!")

/****** 条件语句 ******/
// if
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// 输出 "It's really warm. Don't forget to wear sunscreen."

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}

// Switch

/*
switch some value to consider {
case value 1:
    respond to value 1
case value 2, value 3:
    respond to value 2 or 3
default:
    otherwise, do something else
}
 */

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

// 不存在隐式的贯穿
/*
 与 C 语言和 Objective-C 中的switch语句不同，在 Swift 中，当匹配的 case 分支中的代码执行完毕后，程序会终止switch语句，而不会继续执行下一个 case 分支。这也就是说，不需要在 case 分支中显式地使用break语句。这使得switch语句更安全、更易用，也避免了因忘记写break语句而产生的错误。

    每一个 case 分支都必须包含至少一条语句。像下面这样书写代码是无效的，因为第一个 case 分支是空的
*/
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a":
    print("The letter a")
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// this will report a compile-time error

/*
一个 case 也可以包含多个模式，用逗号把它们分开（如果太长了也可以分行写）
switch some value to consider {
case value 1, value 2:
    statements
}
 */

// 区间匹配
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
        naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "serveral"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

/*
  闭区间操作符(...)以及半开区间操作符(..<)功能被重载去返回IntervalType或Range。一个区间可以决定他是否包含特定的元素，就像当匹配一个switch声明的case一样。区间是一个连续值的集合，可以用for-in语句遍历它。
 */

// 元组（tuple）
/*
 我们可以使用元组在同一个switch语句中测试多个值。元组中的元素可以是值，也可以是区间。另外，使用下划线（_）来匹配所有可能的值。
 */


// 不像 C 语言，Swift 允许多个 case 匹配同一个值。实际上，在这个例子中，点(0, 0)可以匹配所有四个 case。但是，如果存在多个匹配，那么只会执行第一个被匹配到的 case 分支。考虑点(0, 0)会首先匹配case (0, 0)，因此剩下的能够匹配(0, 0)的 case 分支都会被忽视掉。
let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("(0,0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0),\(somePoint.1)) is outside of the box")
}

// 值绑定 （Value Binings）
// case 分支的模式允许将匹配的值绑定到一个临时的常量或变量，这些常量或变量在该 case 分支里就可以被引用了——这种行为被称为值绑定（value binding）。

// 请注意，这个switch语句不包含默认分支。这是因为最后一个 case ——case let(x, y)声明了一个可以匹配余下所有值的元组。这使得switch语句已经完备了，因此不需要再书写默认分支。
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y)")
}

// Where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let(x, y) where x == y:
    print("(\(x), \(y) is on the line x == y")
case let (x, y) where x == -y:
    print ("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}


/****** 控制转移语句 ******/

// Continue 

/*
  continue语句告诉一个循环体立刻停止本次循环迭代，重新开始下次循环迭代。就好像在说“本次循环迭代我已经执行完了”，但是并不会离开整个循环体。

  注意： 在一个带有条件和递增的for循环体中，调用continue语句后，迭代增量仍然会被计算求值。循环体继续像往常一样工作，仅仅只是循环体中的执行代码会被跳过。
 */
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}

// break

/*
 break语句会立刻结束整个控制流的执行。当你想要更早的结束一个switch代码块或者一个循环体时，你都可以使用break语句。

 循环语句中的 break
 当在一个循环体中使用break时，会立刻中断该循环体的执行，然后跳转到表示循环体结束的大括号(})后的第一行代码。不会再有本次循环迭代的代码被执行，也不会再有下次的循环迭代产生。

 Switch 语句中的 break
 当在一个switch代码块中使用break时，会立即中断该switch代码块的执行，并且跳转到表示switch代码块结束的大括号(})后的第一行代码。

 */
let numberSymbol: Character = "三"  // 简体中文里的数字 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

// 贯穿 （Fallthrough）
/*
 Swift 中的switch不会从上一个 case 分支落入到下一个 case 分支中。相反，只要第一个匹配到的 case 分支完成了它需要执行的语句，整个switch代码块完成了它的执行。相比之下，C 语言要求你显式地插入break语句到每个switch分支的末尾来阻止自动落入到下一个 case 分支中。Swift 的这种避免默认落入到下一个分支中的特性意味着它的switch 功能要比 C 语言的更加清晰和可预测，可以避免无意识地执行多个 case 分支从而引发的错误。

 如果你确实需要 C 风格的贯穿的特性，你可以在每个需要该特性的 case 分支中使用fallthrough关键字。下面的例子使用fallthrough来创建一个数字的描述语句。

 */


// 注意： fallthrough关键字不会检查它下一个将会落入执行的 case 中的匹配条件。fallthrough简单地使代码执行继续连接到下一个 case 中的执行代码，这和 C 语言标准中的switch语句特性是一样的。
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += "a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)


// 带标签的语句
/*
 在 Swift 中，你可以在循环体和switch代码块中嵌套循环体和switch代码块来创造复杂的控制流结构。然而，循环体和switch代码块两者都可以使用break语句来提前结束整个方法体。因此，显式地指明break语句想要终止的是哪个循环体或者switch代码块，会很有用。类似地，如果你有许多嵌套的循环体，显式指明continue语句想要影响哪一个循环体也会非常有用。

 为了实现这个目的，你可以使用标签来标记一个循环体或者switch代码块，当使用break或者continue时，带上这个标签，可以控制该标签代表对象的中断或者执行。

 产生一个带标签的语句是通过在该语句的关键词的同一行前面放置一个标签，并且该标签后面还需带着一个冒号。下面是一个while循环体的语法，同样的规则适用于所有的循环体和switch代码块。

 label name: while condition {
    statements
 }
 */

//let finalSquare = 25
//var board = [Int](count: finalSquare + 1, repeatedValue: 0)
//board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
//board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//var square = 0
//var diceRoll = 0
//
//gameLoop: while square != finalSquare {
//    if ++square == 7 {diceRoll = 1}
//    switch square + diceRoll {
//    case finalSquare:
//        break gameLoop
//    case let newSquare where newSquare > finalSquare:
//        continue gameLoop
//    default:
//        square += diceRoll
//        square += board[square]
//    }
//}
//print("Game over")

/****** 提前退出 ******/
/*
  像if语句一样，guard的执行取决于一个表达式的布尔值。我们可以使用guard语句来要求条件必须为真时，以执行guard语句后的代码。不同于if语句，一个guard语句总是有一个else分句，如果条件不为真则执行else分句中的代码。
 */
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(["name": "Jane", "location": "Cupertino"])
greet(["name": "John"])

/****** 检测API可用性 ******/
/*
 Swift 有检查 API 可用性的内置支持，这可以确保我们不会不小心地使用对于当前部署目标不可用的 API。
 */

// 以上可用性条件指定了在 iOS 系统上，if段的代码仅会在 iOS 9 及更高版本的系统上执行；在 OS X，仅会在 OS X v10.10 及更高版本的系统上执行。最后一个参数，*，是必须写的，用于处理未来潜在的平台。
if #available(iOS 9, OSX 10.10, *) {
    // 在 iOS 使用 iOS 9 的 API, 在 OS X 使用 OS X v10.10 的 API
} else {
    // 使用先前版本的 iOS 和 OS X 的 API
}

/*
if #available(platform name version, ..., *) {
    statements to execute if the APIs are available
} else {
    fallback statements to execute if the APIs are unavailable
}
 */