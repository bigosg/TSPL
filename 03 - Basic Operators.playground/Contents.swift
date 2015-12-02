//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/* 运算符有一元、二元和三元运算符。

* 一元运算符对单一操作对象操作（如-a）。一元运算符分前置运算符和后置运算符，前置运算符需紧跟在操作对象之前（如!b），后置运算符需紧跟在操作对象之后（如i++）。
* 二元运算符操作两个操作对象（如2 + 3），是中置的，因为它们出现在两个操作对象之间。
* 三元运算符操作三个操作对象，和 C 语言一样，Swift 只有一个三元运算符，就是三目运算符（a ? b : c）。 */

/****** 赋值运算符 ******/
let b = 10
var a = 5
a = b
let (x, y) = (1, 2)

/****** 算术运算符 ******/
// 加减乘除运算
var APlusB = "hello " + "world"

// 求余运算符
var AModB  = 9 % 4

// 浮点数求余计算
8 % 2.5

// 自增和自减
var i = 0
++i

// 一元负号运算符
let three = 3
let minusThree = -three       // minusThree 等于 -3
let plusThree = -minusThree   // plusThree 等于 3, 或 "负负3"

// 一元正号运算符
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix 等于 -6

/****** 组合赋值运算符 ******/
var compose = 1
compose += 2 // a 现在是 3

/****** 比较运算符 ******/
/* 
等于（a == b）
不等于（a != b）
大于（a > b）
小于（a < b）
大于等于（a >= b）
小于等于（a <= b）

Swift 也提供恒等===和不恒等!==这两个比较符来判断两个对象是否引用同一个对象实例。
*/

let name = "world"
if name == "world" {
   print("hello world")
} else {
    print("I'm sorry \(name), but I don't recoginze you")
}

/***** 三目运算符 ******/
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

/****** 空合运算符 ******/

/*
空合运算符(a ?? b)将对可选类型a进行空判断，如果a包含一个值就进行解封，否则就返回一个默认值b.这个运算符有两个条件:

表达式a必须是Optional类型
默认值b的类型必须要和a存储值的类型保持一致 */

var konghe: String?
var kongnil = "test"
konghe != nil ? konghe! : kongnil

// userDefinedColorName变量被定义为一个可选String类型，默认值为nil。由于userDefinedColorName是一个可选类型，我们可以使用空合运算符去判断其值。在上一个例子中，通过空合运算符为一个名为colorNameToUse的变量赋予一个字符串类型初始值。 由于userDefinedColorName值为空，因此表达式userDefinedColorName ?? defaultColorName返回defaultColorName的值，即red。
let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"

// 另一种情况，分配一个非空值(non-nil)给userDefinedColorName，再次执行空合运算，运算结果为封包在userDefaultColorName中的值，而非默认值。
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 非空，因此 colorNameToUse 的值为 "green"

/****** 区间运算符 ******/

// 闭区间运算符
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

// 半开区间运算符
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}

// 逻辑运算
/*
    逻辑非（!a）
    逻辑与（a && b）
    逻辑或（a || b）
 */

// 逻辑非
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// 输出 "ACCESS DENIED"


// 逻辑与
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出 "ACCESS DENIED"

// 逻辑或
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出 "Welcome!"

// 逻辑运算符组合计算
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出 "Welcome!"

// 使用括号来明确优先级
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出 "Welcome!"














