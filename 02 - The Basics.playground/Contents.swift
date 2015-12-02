//: Playground - noun: a place where people can play

import UIKit

// Swift 包含了 C 和 Objective-C 上所有基础数据类型，Int表示整型值；Double和Float表示浮点型值；Bool是布尔型值；String是文本型数据。Swift 还提供了三个基本的集合类型，Array，Set和Dictionary，详见集合类型。

// 除了我们熟悉的类型，Swift 还增加了 Objective-C 中没有的高阶数据类型比如元组（Tuple）。元组可以让你创建或者传递一组数据，比如作为函数的返回值时，你可以用一个元组可以返回多个值。

// Swift 还增加了可选（Optional）类型，用于处理值缺失的情况。可选表示“那儿有一个值，并且它等于 x ”或者“那儿没有值”。可选有点像在 Objective-C 中使用nil，但是它可以用在任何类型上，不仅仅是类。可选类型比 Objective-C 中的nil指针更加安全也更具表现力，它是 Swift 许多强大特性的重要组成部分。

// Swift 是一门类型安全的语言，可选类型就是一个很好的例子。Swift 可以让你清楚地知道值的类型。如果你的代码期望得到一个String，类型安全会阻止你不小心传入一个Int。你可以在开发阶段尽早发现并修正错误。

/****** 常量和变量 ******/
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

var welcomeMessage: String //类型标注
welcomeMessage = "Hello"

var red, green, blue: Double // 你可以在一行中定义多个同样类型的变量，用逗号分割，并在最后一个变量名之后添加类型标注：

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

var languageName = "Swift"
languageName = "Swift++"


/****** 注释 ******/
// 这是一个注释

/* 这是一个,
多行注释 */

/* 这是第一个多行注释的开头
/* 这是第二个被嵌套的多行注释 */
这是第一个多行注释的结尾 */
print("The current value of friendlyWelcome is \(languageName)")


//与其他大部分编程语言不同，Swift 并不强制要求你在每条语句的结尾处使用分号（;），当然，你也可以按照你自己的习惯添加分号。有一种情况下必须要用分号，即你打算在同一行内写多条独立的语句：

/****** 注释 ******/
let cat = "🐱"; print(cat)
// 输出 "🐱"


/****** 整数 ******/
// Swift 提供了8，16，32和64位的有符号和无符号整数类型。这些整数类型和 C 语言的命名方式很像，比如8位无符号整数类型是UInt8，32位有符号整数类型是Int32。就像 Swift 的其他类型一样，整数类型采用大写命名法。

let minValue = UInt8.min  // minValue 为 0，是 UInt8 类型
let maxValue = UInt8.max  // maxValue 为 255，是 UInt8 类型

// Swift 提供了一个特殊的整数类型Int，长度与当前平台的原生字长相同(处理器最大位数)
let UIntMaxValue = UInt.max
let UInt32MaxValue = UInt32.max
let UInt64MaxValue = UInt64.max
let IntMaxValue = Int.max
let IntMinValue = Int.min


/****** 浮点数 ******/
/*
Double表示64位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型。
Float表示32位浮点数。精度要求不高的话可以使用此类型。

Double精确度很高，至少有15位数字，而Float最少只有6位数字。选择哪个类型取决于你的代码需要处理的值的范围。*/



/****** 类型安全和类型推断 ******/
// meaningOfLife 会被推测为 Int 类型
let meaningOfLife = 42

//如果你没有给浮点字面量标明类型，Swift 会推断你想要的是Double,当推断浮点数的类型时，Swift 总是会选择Double而不是Float。
let pi = 3.14159
// pi 会被推测为 Double 类型

// 如果表达式中同时出现了整数和浮点数，会被推断为Double类型：
let anotherPi = 3 + 0.14159


/******数值型字面量 ******/
let decimalInteger = 17
let binaryInteger = 0b10001 // 二进制
let octalInteger = 0o21 // 八进制
let hexadecimalInteger = 0x11 // 十六进制

//浮点字面量可以是十进制（没有前缀）或者是十六进制（前缀是0x）。小数点两边必须有至少一个十进制数字（或者是十六进制的数字）。浮点字面量还有一个可选的指数（exponent，在十进制浮点数中通过大写或者小写的e来指定，在十六进制浮点数中通过大写或者小写的p来指定。

// 如果一个十进制数的指数为exp，那这个数相当于基数和10^exp的乘积
let floatExp = 1.25e2 // 表示 1.25 × 10^2
let floatExp2 = 1.25e-2 //表示 1.25 × 10^-2

//如果一个十六进制数的指数为exp，那这个数相当于基数和2^exp的乘积
let hexadecimalFloatExp = 0xfp2 //表示 15 × 2^2
let hexadecimalFloatExp2 = 0xFp-2 //表示 15 × 2^-2


let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble1 = 0xC.3p1 // 
let hexadecimalDouble2 = (12 + 3 / 16.0) * 2


let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// 通常来讲，即使代码中的整数常量和变量已知非负，也请使用Int类型。总是使用默认的整数类型可以保证你的整数常量和变量可以直接被复用并且可以匹配整数类字面量的类型推断。

//只有在必要的时候才使用其他整数类型，比如要处理外部的长度明确的数据或者为了优化性能、内存占用等等。使用显式指定长度的类型可以及时发现值溢出并且可以暗示正在处理特殊数据

// let cannotBeNegative: UInt8 = 1
// let tooBig: Int8 = Int8.max + 1

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// SomeType(ofInitialValue)是调用 Swift 构造器并传入一个初始值的默认方法。在语言内部，UInt16有一个构造器，可以接受一个UInt8类型的值，所以这个构造器可以用现有的UInt8来创建一个新的UInt16。注意，你并不能传入任意类型的值，只能传入UInt16内部有对应构造器的值。不过你可以扩展现有的类型来让它可以接收其他类型的值（包括自定义类型）

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pii = Double(three) + pointOneFourOneFiveNine

// 当用这种方式来初始化一个新的整数值时，浮点值会被截断。也就是说4.75会变成4，-3.9会变成-3。
let intgerPi = Int(pii)


/****** 类型别名 ******/
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

/****** 布尔值 ******/
let orangeAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips")
} else {
    print("Ewwm turnips are horrible")
}

/****** 元组 ******/
// 元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。
let http404Error = (404, "Not Found") // 一个类型为（Int, String）的元组

// 你可以将一个元组的内容分解（decompose）成单独的常量和变量，然后你就可以正常使用它们了
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is Not Found")

// 如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

// 此外，你还可以通过下标来访问元组中的单个元素，下标从零开始
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// 你可以在定义元组的时候给单个元素命名
let http200Status = (statusCode: 200, description: "OK")

// 作为函数返回值时，元组非常有用。一个用来获取网页的函数可能会返回一个(Int, String)元组来描述是否获取成功。和只能返回一个类型的值比较起来，一个包含两个不同类型值的元组可以让函数的返回信息更有用。

// 元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。如果你的数据结构并不是临时使用，请使用类或者结构体而不是元组。
print("The status code is \(http200Status.statusCode)")
print("The staus message is \(http200Status.description)")


/****** 可选类型 ******/
// 可选类型（optionals） 用来处理值可能缺失的情况：有值，等于x 或者 没有值
let possibleNumber = "123"

// 因为该构造器可能会失败，所以它返回一个可选类型（optional）Int，而不是一个Int。一个可选的Int被写作Int?而不是Int。问号暗示包含的值是可选类型，也就是说可能包含Int值也可能不包含值。（不能包含其他任何值比如Bool值或者String值。只能是Int或者什么都没有。
let convertedNumber = Int(possibleNumber) // convertedNumber 被推断成“Int?”, 或者“Optional Int”

// nil
var serverResponseCode: Int? = 404
// 因为该构造器可能会失败，所以它返回一个可选类型（optional）Int，而不是一个Int。一个可选的Int被写作Int?而不是Int。问号暗示包含的值是可选类型，也就是说可能包含Int值也可能不包含值。（不能包含其他任何值比如Bool值或者String值。只能是Int或者什么都没有。
serverResponseCode = nil

// Swift 的nil和 Objective-C 中的nil并不一样。在 Objective-C 中，nil是一个指向不存在对象的指针。在 Swift 中，nil不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型。
var surveyAnswer: String? // surveyAnswer 被自动设置为nil

// 你可以使用if语句和nil比较来判断一个可选值是否包含值。你可以使用“相等”(==)或“不等”(!=)来执行比较。如果可选类型有值，它将不等于nil
if convertedNumber != nil {
    print("convertedNumber contains some integer value")
}

// 当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号（!）来获取值。这个惊叹号表示“我知道这个可选有值，请使用它。”这被称为可选值的强制解析（forced unwrapping）：
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)") // 使用!来获取一个不存在的可选值会导致运行时错误。使用!来强制解析值之前，一定要确定可选包含一个非nil的值。
}

//可选绑定
if let actualNumber = Int(possibleNumber) {
    // “如果Int(possibleNumber)返回的可选Int包含一个值，创建一个叫做actualNumber的新常量并将可选包含的值赋给它。” 如果转换成功，actualNumber常量可以在if语句的第一个分支中使用。它已经被可选类型_包含的_值初始化过，所以不需要再使用!后缀来获取它的值。
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
     print("\'\(possibleNumber)\' could not be converted to an integer")
}

if let firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}

// 隐式解析可选类型 
/* 有时候在程序架构中，第一次被赋值之后，可以确定一个可选类型_总会_有值。在这种情况下，每次都要判断和解析可选值是非常低效的，因为可以确定它总会有值。

这种类型的可选状态被定义为隐式解析可选类型（implicitly unwrapped optionals）。把想要用作可选的类型的后面的问号（String?）改成感叹号（String!）来声明一个隐式解析可选类型。

当可选类型被第一次赋值之后就可以确定之后一直有值的时候，隐式解析可选类型非常有用。隐式解析可选类型主要被用在 Swift 中类的构造过程中 */

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

/****** 错误处理 ******/
func canThrowAnError() throws {
    
}

do {
    try canThrowAnError()
        
}   catch {
        
}

/****** 断言 ******/
let age = 9
assert(age >= 0, "A person's age cannot be less than zero")

/* 当条件可能为假时使用断言，但是最终一定要_保证_条件为真，这样你的代码才能继续运行。断言的适用情景：

整数类型的下标索引被传入一个自定义下标脚本实现，但是下标索引值可能太小或者太大。
需要给函数传入一个值，但是非法的值可能导致函数不能正常执行。
一个可选值现在是nil，但是后面的代码运行需要一个非nil值。 */
assert(age >= 0)



























































