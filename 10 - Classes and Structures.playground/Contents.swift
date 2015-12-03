//==================
//   类和结构体对比
//==================

/*
 Swift 中类和结构体有很多共同点。共同处在于：
 - 定义属性用于存储值
 - 定义方法用于提供功能
 - 定义附属脚本用于访问值
 - 定义构造器用于生成初始化值
 - 通过扩展以增加默认实现的功能
 - 实现协议以提供某种标准功能

 与结构体相比，类还有如下的附加功能：

 - 继承允许一个类继承另一个类的特征
 - 类型转换允许在运行时检查和解释一个类实例的类型
 - 解构器允许一个类实例释放任何其所被分配的资源
 - 引用计数允许对一个类的多次引用
*/

// 定义语法
class SomeClass {
    
}

struct someStructure {
    
}

struct Resolution {
    var width = 0
    var heigh = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}


// 类和结构体实例
let someResolution = Resolution()
let someVideoMode = VideoMode()

// 属性访问
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

// 结构体类型的成员逐一构造器
/*
  所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。
 */
let vga = Resolution(width: 640, heigh: 480)


//=========================
//   结构体和枚举是值类型
//=========================

/* 值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。*/

let hd = Resolution(width: 1920, heigh: 1080)
var cinema = hd

cinema.width = 2048

/*
  在将hd赋予给cinema的时候，实际上是将hd中所存储的值进行拷贝，然后将拷贝的数据存储到新的cinema实例中。结果就是两个完全独立的实例碰巧包含有相同的数值。由于两者相互独立，因此将cinema的width修改为2048并不会影响hd中的width的值。
 */
print("cinema is now  \(cinema.width) pixels wide")
// 输出 "cinema is now 2048 pixels wide"

print("hd is still \(hd.width) pixels wide")
// 输出 "hd is still 1920 pixels wide"

enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remembered direction is still .West")
}
// 输出 "The remembered direction is still .West"

//================
//   类是引用类型
//================

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

//恒等运算符
/*
  - 等价于 （ === ）
  - 不等价于 （ ！= ）

 请注意，“等价于”（用三个等号表示，===）与“等于”（用两个等号表示，==）的不同：

 “等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
 “等于”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。
*/

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same Resolution instance.")
}

// 指针


//====================
//   类和结构体的选择
//====================

/*
结构体实例总是通过值传递，类实例总是通过引用传递。这意味两者适用不同的任务。当你在考虑一个工程项目的数据结构和功能的时候，你需要决定每个数据结构是定义成类还是结构体。

按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：

- 该数据结构的主要目的是用来封装少量相关简单数据值。
- 有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
- 该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
- 该数据结构不需要去继承另一个既有类型的属性或者行为。


举例来说，以下情境中适合使用结构体：
- 几何形状的大小，封装一个width属性和height属性，两者均为Double类型。
- 一定范围内的路径，封装一个start属性和length属性，两者均为Int类型。
- 三维坐标系内一点，封装x，y和z属性，三者均为Double类型。

在所有其它案例中，定义一个类，生成一个它的实例，并通过引用来管理和传递。实际中，这意味着绝大部分的自定义数据构造都应该是类，而非结构体。
*/

//======================================
//   字符串、数组、字典类型的赋值与复制行为
//======================================

/*
 Swift 中，许多基本类型，诸如String，Array和Dictionary类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。

 Objective-C 中NSString，NSArray和NSDictionary类型均以类的形式实现，而并非结构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用。
 */
