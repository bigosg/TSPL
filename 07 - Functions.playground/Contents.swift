//====================================
//   Defining and Calling Functions
//====================================
func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

print(sayHello("Anna"))

func sayHelloAgain(personName: String) -> String {
    return "Hello again, " + personName + "!"
}

print(sayHelloAgain("Anna"))

//============================================
//   Function Parameters and Return Values
//============================================

// Function Without Parameters
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

// Funcionts With Multiple Parameters
func sayHello(personName: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return sayHelloAgain(personName)
    } else {
        return sayHello(personName)
    }
}
print(sayHello("Tim", alreadyGreeted: true))


// Functions without Return Values
func sayGoodbye(personName: String) { // return null tuple
    print("Goodbye, \(personName)!")
}
sayGoodbye("Dave")

// Functions with Multiple Return Values
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[1]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax([8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")


// Optional Tuple Return Types
func minMax1(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds1 = minMax1([8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds1.min) and max is \(bounds1.max)")
}

//==============================
//   Function Parameter Names
//==============================

/*
  函数参数都有一个外部参数名（external parameter name）和一个局部参数名（local parameter name）。外部参数名用于在函数调用时标注传递给函数的参数，局部参数名在函数的实现内部使用。

 func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // function body goes here
    // firstParameterName and secondParameterName refer to
    // the argument values for the first and second parameters
 }

 一般情况下，第一个参数省略其外部参数名，第二个以及随后的参数使用其局部参数名作为外部参数名。所有参数必须有独一无二的局部参数名。尽管多个参数可以有相同的外部参数名，但不同的外部参数名能让你的代码更有可读性。
 someFunction(1, secondParameterName: 2)
*/

// 指定外部参数名
// 你可以在局部参数名前指定外部参数名，中间以空格分隔, 如果你提供了外部参数名，那么函数在被调用时，必须使用外部参数名。

/*
 func someFunction(externalParameterName localParameterName: Int) {
    // function body goes here, and can use localParameterName
    // to refer to the argument value for that parameter
 }
 */
func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)"
}

print(sayHello(to: "Bill", and: "Ted"))


// Omitting External Parameter Names
func someFuction(firstParameterName: Int, _ secondParameterName: Int) {
    print("\(firstParameterName) + \(secondParameterName)")
}

someFuction(1, 2)

// Default Parameter Values
func somFunction(parameterWithDefault: Int = 12) {
    print("\(parameterWithDefault)")
}

//somFunction(6)
somFunction()

// Variadic Parameters

// 一个函数最多只能有一个可变参数。 如果函数有一个或多个带默认值的参数，而且还有一个可变参数，那么把可变参数放在参数表的最后。
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)

arithmeticMean(3, 8.25, 18.75)

// In-Out Parameters

/*
变量参数，正如上面所述，仅仅能在函数体内被更改。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数（In-Out Parameters）。

定义一个输入输出参数时，在参数定义前加 inout 关键字。一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值。想获取更多的关于输入输出参数的细节和相关的编译器优化，请查看输入输出参数一节。

你只能传递变量给输入输出参数。你不能传入常量或者字面量（literal value），因为这些量是不能被修改的。当传入的参数作为输入输出参数时，需要在参数名前加&符，表示这个值可以被函数修改。

输入输出参数不能有默认值，而且可变参数不能用 inout 标记。如果你用 inout 标记一个参数，这个参数不能被 var 或者 let 标记。

 */


// 输入输出参数和返回值是不一样的。上面的 swapTwoInts 函数并没有定义任何返回值，但仍然修改了 someInt 和 anotherInt 的值。输入输出参数是函数对函数体外产生影响的另一种方式。
func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)

print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//====================
//   Function Types
//====================
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}

// Using Function Types

/*
 这个可以解读为：

 “定义一个叫做 mathFunction 的变量，类型是‘一个有两个 Int 型的参数并返回一个 Int 型的值的函数’，并让这个新变量指向 addTwoInts 函数”。

 addTwoInts 和 mathFunction 有同样的类型，所以这个赋值过程在 Swift 类型检查中是允许的。
 */
var mathFunction: (Int, Int) -> Int = multiplyTwoInts

print("Result: \(mathFunction(2,3))")


// Function Types as Parameters Types
/*
  你可以用(Int, Int) -> Int这样的函数类型作为另一个函数的参数类型。这样你可以将函数的一部分实现留给函数的调用者来提供。
 */


/*
这个例子定义了 printMathResult(_:_:_:) 函数，它有三个参数：第一个参数叫 mathFunction，类型是(Int, Int) -> Int，你可以传入任何这种类型的函数；第二个和第三个参数叫 a 和 b，它们的类型都是 Int，这两个值作为已给出的函数的输入值。

当 printMathResult(_:_:_:) 被调用时，它被传入 addTwoInts 函数和整数3和5。它用传入3和5调用 addTwoInts，并输出结果：8。
 */
func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

//printMathResult(addTwoInts, 3, 5)

printMathResult(multiplyTwoInts, 3, 5)


// Function Types as return types
/*
  你可以用函数类型作为另一个函数的返回类型。你需要做的是在返回箭头（->）后写一个完整的函数类型。
 */

func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward :stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)

print("Counting to zero")
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}

print("zero!")

//======================
//   Nested Functions
//======================

/*
 这章中你所见到的所有函数都叫全局函数（global functions），它们定义在全局域中。你也可以把函数定义在别的函数体中，称作嵌套函数（nested functions）。

 默认情况下，嵌套函数是对外界不可见的，但是可以被它们的外围函数（enclosing function）调用。一个外围函数也可以返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用。

 */

func chooseStepFunction1(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {return input + 1}
    func stepBackward(input: Int) -> Int {return input - 1}
    return backwards ? stepBackward : stepForward
}

var currentValue1 = -4
let moveNearerToZero1 = chooseStepFunction1(currentValue1 > 0)

while currentValue1 != 0 {
    print("\(currentValue1)... ")
    currentValue1 = moveNearerToZero1(currentValue1)
}

print("zero")
