/*
 - 闭包是自包含的函数代码块，可以在代码中被传递和使用。Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的匿名函数比较相似。

 - 闭包可以捕获和存储其所在上下文中任意常量和变量的引用。这就是所谓的闭合并包裹着这些常量和变量，俗称闭包。Swift 会为您管理在捕获过程中涉及到的所有内存操作。

 - 在函数章节中介绍的全局和嵌套函数实际上也是特殊的闭包，闭包采取如下三种形式之一：

    *全局函数是一个有名字但不会捕获任何值的闭包
    *嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
    *闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包

 - Swift 的闭包表达式拥有简洁的风格，并鼓励在常见场景中进行语法优化，主要优化如下：
    *利用上下文推断参数和返回值类型
    *隐式返回单表达式闭包，即单表达式闭包可以省略return关键字
    *参数名称缩写
    *尾随（Trailing）闭包语法
 */

//===================================
//   Closure Expreesions 闭包表达式
//===================================

// sort 方法
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sort(backwards)

// 闭包表达式语法
/*
  { (parameters) ->  returnType in 
       statements
  }
 */

reversed = names.sort({ (s1: String, s2: String) -> Bool in return s1 > s2 })

// 根据上下文判断类型
reversed = names.sort( { s1, s2 in return s1 > s2})


// 单表达式闭包隐式返回
/* 行表达式闭包可以通过省略return关键字来隐式返回单行表达式的结果 */
reversed = names.sort({s1, s2  in s1 > s2})
print("\(reversed)")

// 参数名称缩写
reversed = names.sort({ $0 > $1 })
print("\(reversed)")

// 运算符函数(Opreator Functions)
/* 实际上还有一种更简短的方式来撰写上面例子中的闭包表达式。 */
reversed = names.sort(>)

//=================================
//   尾随闭包 (Trailing Closures)
//=================================

func someFunctionThatTakesAClousure(closure: () -> Void) {
    // 函数体部分
}

// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClousure({
    // 闭包主题部分
})

// 以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClousure() {
    // 闭包主体部分
}

// 在闭包表达式语法一节中作为sort(_:)方法参数的字符串排序闭包可以改写为
reversed = names.sort() { $0 > $1 }

// 如果函数只需要闭包表达式一个参数，当您使用尾随闭包时，您甚至可以把()省略掉
reversed = names.sort { $0 > $1 }


let digitNames = [
    0: "", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var output = ""
    var number = number
    while number > 0 {
        /*
          字典digitNames下标后跟着一个叹号（!），因为字典下标返回一个可选值（optional value），表明该键不存在时会查找失败。在上例中，由于可以确定number % 10总是digitNames字典的有效下标，因此叹号可以用于强制解包 (force-unwrap) 存储在下标的可选类型的返回值中的String类型的值。
         */
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}
print("\(strings)")

//============================
//  捕获值 (Capturing Values)
//============================

/*
  嵌套函数incrementor()从上下文中捕获了两个值，runningTotal和amount。捕获这些值之后，makeIncrementor将incrementor作为闭包返回。每次调用incrementor时，其会以amount作为增量增加runningTotal的值。

  makeIncrementor返回类型为() -> Int。这意味着其返回的是一个函数，而不是一个简单类型的值。该函数在每次调用时不接受参数，只返回一个Int类型的值。关于函数返回其他函数的内容

  incrementer()函数并没有任何参数，但是在函数体内访问了runningTotal和amount变量。这是因为它从外围函数捕获了runningTotal和amount变量的引用。捕获引用保证了runningTotal和amount变量在调用完makeIncrementer后不会消失，并且保证了在下一次执行incrementer函数时，runningTotal依旧存在。

   为了优化，如果一个值是不可变的，Swift 可能会改为捕获并保存一份对值的拷贝。
   Swift 也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量。

 */
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

/*
  该例子定义了一个叫做incrementByTen的常量，该常量指向一个每次调用会将runningTotal变量增加10的incrementor函数。调用这个函数多次可以得到以下结果
 */
let incrementByTen = makeIncrementer(forIncrement: 10)
print("\(incrementByTen())")
incrementByTen()
incrementByTen()
incrementByTen()

// 如果您创建了另一个incrementor，它会有属于它自己的一个全新、独立的runningTotal变量的引用
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()

// 再次调用原来的incrementByTen会在原来的变量runningTotal上继续增加值，该变量和incrementBySeven中捕获的变量没有任何联系
incrementByTen()

//==================
//   闭包是引用类型
//==================

/*
 上面的例子中，incrementBySeven和incrementByTen是常量，但是这些常量指向的闭包仍然可以增加其捕获的变量的值。这是因为函数和闭包都是引用类型。

 无论您将函数或闭包赋值给一个常量还是变量，您实际上都是将常量或变量的值设置为对应函数或闭包的引用。上面的例子中，指向闭包的引用incrementByTen是一个常量，而并非闭包内容本身。

 这也意味着如果您将闭包赋值给了两个不同的常量或变量，两个值都会指向同一个闭包
 */
let alsoInCrementByTen = incrementByTen
alsoInCrementByTen()


//===============
//   非逃逸闭包
//===============

/*
  当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注@noescape，用来指明这个闭包是不允许“逃逸”出这个函数的。将闭包标注@noescape能使编译器知道这个闭包的生命周期（译者注：闭包只能在函数体中被执行，不能脱离函数体执行，所以编译器明确知道运行时的上下文），从而可以进行一些比较激进的优化。
 */

func someFunctionWithNoescapeClousure(@noescape closure: () -> Void) {
    closure()
}

var completionHandlers: [() -> Void] = []

/*
  someFunctionWithEscapingClosure(_:)函数接受一个闭包作为参数，该闭包被添加到一个函数外定义的数组中。如果你试图将这个参数标注为@noescape，你将会获得一个编译错误
 */
func someFunctionWithEscapingClosure(completionHandler: () -> Void) {
    completionHandlers.append(completionHandler)
}

/*
  将闭包标注为@noescape使你能在闭包中隐式地引用self
 */
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure{ self.x = 100 }
        someFunctionWithNoescapeClousure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

//=============
//   自动闭包
//=============

/*
  自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够用一个普通的表达式来代替显式的闭包，从而省略闭包的花括号。

  我们经常会调用一个接受闭包作为参数的函数，但是很少实现那样的函数。举个例子来说，assert(condition:message:file:line:)函数接受闭包作为它的condition参数和message参数；它的condition参数仅会在 debug 模式下被求值，它的message参数仅当condition参数为false时被计算求值。

  自动闭包让你能够延迟求值，因为代码段不会被执行直到你调用这个闭包。延迟求值对于那些有副作用（Side Effect）和代价昂贵的代码来说是很有益处的，因为你能控制代码什么时候执行

  尽管在闭包的代码中，customersInLine的第一个元素被移除了，不过在闭包被调用之前，这个元素是不会被移除的。如果这个闭包永远不被调用，那么在闭包里面的表达式将永远不会执行，那意味着列表中的元素永远不会被移除。请注意，customerProvider的类型不是String，而是() -> String，一个没有参数且返回值为String的函数。

 */
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
let customerProvider = {customersInLine.removeAtIndex(0)}
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)

// 将闭包作为参数传递给函数时，你能获得同样的延时求值行为。
func serveCustomer(customerProvider:() -> String) {
    print("Now serving \(customerProvider())!")
}

serveCustomer( { customersInLine.removeAtIndex(0) } )
// prints "Now serving Alex!"


// 过度使用autoclosures会让你的代码变得难以理解。上下文和函数名应该能够清晰地表明求值是被延迟执行的。
func serveCustomer(@autoclosure customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer(customersInLine.removeAtIndex(0))
// prints "Now serving Ewa!"

// @autoclosure特性暗含了@noescape特性，这个特性在非逃逸闭包一节中有描述。如果你想让这个闭包可以“逃逸”，则应该使用@autoclosure(escaping)特性.

/*
   在上面的代码中，collectCustomerProviders(_:)函数并没有调用传入的customerProvider闭包，而是将闭包追加到了customerProviders数组中。这个数组定义在函数作用域范围外，这意味着数组内的闭包将会在函数返回之后被调用。因此，customerProvider参数必须允许“逃逸”出函数作用域。
 */
var customerProviders:[() -> String] = []
func collectCustomerProviders(@autoclosure(escaping) customerProvider: () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.removeAtIndex(0))
collectCustomerProviders(customersInLine.removeAtIndex(0))
print("Collected \(customerProviders.count) closures.")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
