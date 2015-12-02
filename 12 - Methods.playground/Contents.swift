
//=============================
//  实例方法（Instance Methods）
//=============================

class Counter {
    var count = 0
    func increment() {
        ++count
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.reset()

// 方法的局部参数名称和外部参数名称(Local and External Parameter Names for Methods)
class Counter1 {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}

let counter1 = Counter1()
counter1.incrementBy(5, numberOfTimes: 3)


// 修改方法的外部参数名称(Modifying External Parameter Name Behavior for Methods)
/* 
 NOTE:
 1. 有时为方法的第一个参数提供一个外部参数名称是非常有用的，尽管这不是默认的行为。你自己可以为第一个参数添加一个显式的外部名称。
 2. 相反，如果你不想为方法的第二个及后续的参数提供一个外部名称，可以通过使用下划线（_）作为该参数的显式外部名称，这样做将覆盖默认行为。
 */

// self 属性(The self Property)
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    print("This point is to the right of the line where x == 1.0")
}

// 在实例方法中修改值类型(Modifying Value Types from Within Instance Methods)
struct MutatingPoint {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint1 = MutatingPoint(x: 1.0, y: 1.0)
somePoint1.moveByX(2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

// Calling mutating method on constant struct throws error
let fixedPoint = MutatingPoint(x: 3.0, y: 3.0)
//fixedPoint.moveByX(2.0, y: 3.0)

// 在可变方法中给 self 赋值(Assigning to self Within a Mutating structure)
struct MutatingSelfPoint {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = MutatingSelfPoint(x: x + deltaX, y: y + deltaY)
    }
}

// 在可变方法中给 self 赋值(Assigning to self Within a Mutating enumeration)
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()

//=======================
// 类型方法 (Type Methods)
//=======================
class SomeClass {
    static func someTypeMethod() {
        
    }
}

SomeClass.someTypeMethod()


// Types methods in a structure
struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
// 打印输出：level 6 has not yet been unlocked
