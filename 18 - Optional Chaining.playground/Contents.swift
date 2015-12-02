

/*
  可选链式调用（Optional Chaining）是一种可以在当前值可能为nil的可选值上请求和调用属性、方法及下标的方法。如果可选值有值，那么调用就会成功；如果可选值是nil，那么调用将返回nil。多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为nil，整个调用链都会失败，即返回nil。
 */


//=============================
//   使用可选链式调用代替强制展开
//=============================
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()
// let roomCount = john.residence!.numberOfRooms // runtime error

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

//==========================
//   为可选链式调用定义模型类
//==========================
class Person1 {
    var residence: Residence1?
}

class Residence1 {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}

//==========================
//   通过可选链式调用访问属性
//==========================
let john1 = Person1()
if let roomCount = john1.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john1.residence?.address = someAddress

func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    return someAddress
}

john1.residence?.address = createAddress()

//==========================
//   通过可选链式调用调用方法
//==========================


if john1.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

if (john1.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}

//==========================
//   通过可选链式调用访问下标
//==========================
if let firstRoomName = john1.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

john1.residence?[0] = Room(name: "Bathroom")


let johnsHouse = Residence1()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john1.residence = johnsHouse

if let firstRoomName = john1.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

// john1.residence?[1].name 等价于 john1.residence?.rooms[1].name
if let firstRoomName = john1.residence?[1].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}


//=====================
//   访问可选类型的下标
//=====================
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0]++
testScores["Brian"]?[0] = 72


//=======================
//   连接多层可选链式调用
//=======================

if let johnsStreet = john1.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

let johnsAddress = Address()
johnsAddress.buildingName  = "The Larches"
johnsAddress.street = "Laurel Street"
john1.residence?.address = johnsAddress

if let johnsStreet = john1.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

//====================================
//   在方法的可选返回值上进行可选链式调用
//====================================
if let buildingIdentifier = john1.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}

if let beginsWithThe = john1.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}

















