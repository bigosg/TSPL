
//================
//   定义一个基类
//================

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        //
    }
}

let someVehicle = Vehicle()
someVehicle.description

//==========================
//   子类生成（Subclassing）
//==========================
class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
bicycle.description

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
tandem.description


//======================
//   重写（Overriding）
//======================

// 访问超类的方法，属性及下标脚本
/*
  在合适的地方，你可以通过使用super前缀来访问超类版本的方法，属性或下标脚本：
  - 在方法someMethod()的重写实现中，可以通过super.someMethod()来调用超类版本的someMethod()方法。
  - 在属性someProperty的 getter 或 setter 的重写实现中，可以通过super.someProperty来访问超类版本的someProperty属性。
  - 在下标脚本的重写实现中，可以通过super[someIndex]来访问超类版本中的相同下标脚本。
 */

// 重写方法
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

// 重写属性

//重写属性的Getters和Setters方法
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
car.description

// 重写属性观察器（Property Observer）
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
automatic.description

//=============
//   防止重写
//=============

/*
  - 你可以通过把方法，属性或下标脚本标记为final来防止它们被重写，只需要在声明关键字前加上final修饰符即可（例如：final var，final func，final class func，以及final subscript）。

  - 如果你重写了final方法，属性或下标脚本，在编译时会报错。在类扩展中的方法，属性或下标脚本也可以在扩展的定义里标记为 final 的。

  - 你可以通过在关键字class前添加final修饰符（final class）来将整个类标记为 final 的。这样的类是不可被继承的，试图继承这样的类会导致编译报错。
 */




















