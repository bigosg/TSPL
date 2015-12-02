
//=================
//   ARC的工作机制
//=================

//=============
//   ARC实践
//=============
class Person0 {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitalized")
    }
}

var reference1: Person0?
var reference2: Person0?
var reference3: Person0?
reference1 = Person0(name: "John Appleseed")
reference2 = reference1
reference3 = reference1
reference1 = nil
reference2 = nil
reference3 = nil // 打印 “John Appleseed is being deinitialized”

//========================
//   类实例之间的循环强引用
//========================
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john:Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")
john!.apartment = unit4A
unit4A!.tenant = john

/*
  当你把这两个变量设为nil时，没有任何一个析构函数被调用。循环强引用会一直阻止Person和Apartment类实例的销毁，这就在你的应用程序中造成了内存泄漏。
 */
john = nil
unit4A = nil

//==========================
//   解决实例之间的循环强引用
//==========================

/*
  对于生命周期中会变为nil的实例使用弱引用。相反地，对于初始化赋值后再也不会被赋值为nil的实例，使用无主引用。
 */

// 弱引用
class PersonWeak {
    let name: String
    init(name: String) { self.name = name }
    var apartment: ApartmentWeak?
    deinit { print("\(name) is being deinitialized") }
}

class ApartmentWeak {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: PersonWeak?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var weakJohn: PersonWeak?
var weakUnit4A: ApartmentWeak?

weakJohn = PersonWeak(name: "John Appleseed")
weakUnit4A = ApartmentWeak(unit: "4A")

weakJohn!.apartment = weakUnit4A
weakUnit4A?.tenant = weakJohn
weakJohn = nil
weakUnit4A = nil

// 无主引用
/*
  和弱引用类似，无主引用不会牢牢保持住引用的实例。和弱引用不同的是，无主引用是永远有值的。因此，无主引用总是被定义为非可选类型（non-optional type）。你可以在声明属性或者变量时，在前面加上关键字unowned表示这是一个无主引用。
 */

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Vard #\(number) is being deinitialized") }
}

var tom: Customer?
tom = Customer(name: "Tom Lee")
tom!.card = CreditCard(number: 1234_5678_9012_3456, customer: tom!)

tom = nil

// 无主引用以及隐式解析可选属性
class Country {
    let name: String
    var capitalCity: City! // 将Country的capitalCity属性声明为隐式解析可选类型的属性。
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

//=======================
//   闭包引起的循环强引用
//=======================
/*
  循环强引用还会发生在当你将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了这个类实例时。这个闭包体中可能访问了实例的某个属性，例如self.someProperty，或者闭包中调用了实例的某个方法，例如self.someMethod()。这两种情况都导致了闭包“捕获”self，从而产生了循环强引用。

  循环强引用的产生，是因为闭包和类相似，都是引用类型。当你把一个闭包赋值给某个属性时，你是将这个闭包的引用赋值给了属性。实质上，这跟之前的问题是一样的——两个强引用让彼此一直有效。但是，和两个类实例不同，这次一个是类实例，另一个是闭包。

  Swift 提供了一种优雅的方法来解决这个问题，称之为闭包捕获列表（closuer capture list）
 */
class  HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: Void -> String  = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}
let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())
// 打印 “<h1>some default text</h1>”


var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
// 打印 “hello, world”
paragraph = nil


//==========================
//   解决闭包引起的循环强引用
//==========================

// 定义捕获列表
/*
lazy var someClosure: (Int, String) -> String = {
    [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
    // 这里是闭包的函数体
}

lazy var someClosure: Void -> String = {
 [unowned self, weak delegate = self.delegate!] in
    // 这里是闭包的函数体
}
*/


// 弱引用和无主引用
class HTMLELement1 {
    let name: String
    let text: String?
    lazy var asHTML: Void -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph1: HTMLELement1? = HTMLELement1(name: "p", text: "hello, world")
print(paragraph1!.asHTML())
// 打印 “<p>hello, world</p>”
paragraph1 = nil
