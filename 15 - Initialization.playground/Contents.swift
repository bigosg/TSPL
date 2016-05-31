
//=====================
//   存储属性的初始赋值
//=====================

// 构造器
struct Fahrenheit {
    var temprature: Double
    init() {
        temprature = 32.0
    }
}

var f = Fahrenheit()
f.temprature

// 默认属性值
struct Fahrenheit1 {
    var temperature = 32.0
}

//==================
//   自定义构造过程
//==================

// 构造参数
struct Celsius {
    var temperatureCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
boilingPointOfWater.temperatureCelsius
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.temperatureCelsius

// 参数的内部名称和外部名称
struct Color {
    let red, green, blue: Double
    init(red: Double, green:Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

// let veryGreen = Color(0.0, 1.0, 0.0)

// 不带外部名的构造器参数
struct Celsius1 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromkelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let bodyTemperature = Celsius1(37.0)
bodyTemperature.temperatureInCelsius

// 可选属性类型
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like chesse?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese"

// 构造过程中常量属性的修改
class SurveyQuestion1 {
    // 你可以在构造过程中的任意时间点修改常量属性的值，只要在构造过程结束时是一个确定的值。一旦常量属性被赋值，它将永远不可更改。
    let text: String
    var response: String?
    init(text: String) {
        self.text = text  // 存储属性不初始化会报错。
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion1(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets.(But not with cheese)"

//==============
//   默认构造器
//==============
/*
  如果结构体或类的所有属性都有默认值，同时没有自定义的构造器，那么 Swift 会给这些结构体或类提供一个默认构造器。这个默认构造器将简单地创建一个所有属性值都设置为默认值的实例。
 */
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
item.name
item.quantity
item.purchased

// 结构体的逐一成员构造器
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
twoByTwo.width
twoByTwo.height

//=====================
//   值类型的构造器代理
//=====================
/*
  构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复。
  在 Effective Java 中可以提到可以采用 Builder模式来实现构造器代理。
 */
struct Point {
    var x = 0.0, y = 0.0
}

struct  Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
basicRect

let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))
originRect

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
    size: Size(width: 3.0, height: 3.0))

//=====================
//   类的继承和构造过程
//=====================


// 指定构造器和便利构造器
/*
  - 指定构造器是类中最主要的构造器。一个指定构造器将初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化。
  - 便利构造器是类中比较次要的、辅助型的构造器。
 */

// 指定构造器和便利构造器的语法

/*
init (parameters: String) {
    //statements
}
convenience init(parameters: String ) {
    //statements
}
*/

// 类的构造器代理规则
/*
  - 指定构造器必须调用其直接父类的的指定构造器。
  - 便利构造器必须调用同一类中定义的其它构造器。
  - 便利构造器必须最终导致一个指定构造器被调用。

  一个更方便记忆的方法是：
  - 指定构造器必须总是向上代理
  - 便利构造器必须总是横向代理
 */

// 两段式构造过程



//=================
//   可失败构造器
//=================




//===============
//   必要构造器
//===============



//===============================
//   通过闭包或函数设置属性的默认值
//===============================
