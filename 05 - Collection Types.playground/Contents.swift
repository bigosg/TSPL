//: Playground - noun: a place where people can play

import UIKit

/* Swift 语言提供Arrays、Sets和Dictionaries三种基本的集合类型用来存储集合数据。数组（Arrays）是有序数据的集。集合（Sets）是无序无重复数据的集。字典（Dictionaries）是无序的键值对的集。

   Swift 语言中的Arrays、Sets和Dictionaries中存储的数据值类型必须明确。这意味着我们不能把不正确的数据类型插入其中。同时这也说明我们完全可以对取回值的类型非常自信。

   Swift 的Arrays、Sets和Dictionaries类型被实现为泛型集合。
*/

/****** 集合的可变性 ******/


/****** 数组 ******/
/* 数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。

注意: Swift 的Array类型被桥接到Foundation中的NSArray类。 更多关于在Foundation和Cocoa中使用Array的信息，参见 Using Swift with Cocoa and Obejective-C 一书。 
*/

// 数组的简单写法 Array<Element>

// 创建一个空数组
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items")

someInts.append(3)
someInts = []

// 创建一个带有默认值的数组
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)

// 通过两个数组相加创建一个数组
var antherThreeDoubles = Array(count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + antherThreeDoubles

// 用字面量构造数组
var shoppingList:[String] = ["Eggs", "Milk"]

// 访问和修改数组
print("The shopping list contains \(shoppingList.count) items")

if shoppingList.isEmpty {
    print("The shopping list is empty")
} else {
    print("The shopping list is not empty")
}

shoppingList.append("Flour")

shoppingList += ["Baking Powder"]

shoppingList += ["Chocolate SPread", "Cheese", "Butter"]

shoppingList[0] = "Six  eggs"

var firstItem = shoppingList[0]

shoppingList[3...5]

shoppingList[3..<5]

shoppingList.insert("Maple Syrup", atIndex: 0)

let mapleSylup = shoppingList.removeAtIndex(0)

// 数组的遍历
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("Item \(String(index + 1)): \(value)")
}


/****** 集合 ******/

/*
 集合(Set)用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。 Swift的Set类型被桥接到Foundation中的NSSet类。
*/


/*
    因为Hashable协议符合Equatable协议，所以符合该协议的类型也必须提供一个"是否相等"运算符(==)的实现。这个Equatable协议要求任何符合==实现的实例间都是一种相等的关系。也就是说，对于a,b,c三个值来说，==的实现必须满足下面三种情况：

    a == a(自反性)
    a == b意味着b == a(对称性)
    a == b && b == c意味着a == c(传递性)
 */

// 集合类型语法 Set<Elment>

// 创建和构造一个空的集合
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items")

letters.insert("a")

letters = []

// 用数组字面量创建集合
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

// 访问和修改一个集合
print("I have \(favoriteGenres.count) favorite music geres")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGere = favoriteGenres.remove("Rock") {
    print("\(removedGere)? I'm over it.")
} else {
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

// 遍历一个集合
for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sort() {
    print("\(genre)")
}

// 集合操作
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sort()

oddDigits.intersect(evenDigits).sort()

oddDigits.subtract(evenDigits).sort()

oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

// 集合成员关系和相等

/*
 使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值。
 使用isSubsetOf(_:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
 使用isSupersetOf(_:)方法来判断一个集合中包含另一个集合中所有的值。
 使用isStrictSubsetOf(_:)或者isStrictSupersetOf(_:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
使用isDisjointWith(_:)方法来判断两个集合是否不含有相同的值。
 */

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSubsetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)


/****** 字典 ******/

/*
  字典是一种存储多个相同类型的值的容器。每个值（value）都关联唯一的键（key），键作为字典中的这个值数据的标识符。和数组中的数据项不同，字典中的数据项并没有具体顺序。我们在需要通过标识符（键）访问数据的时候使用字典，这种方法很大程度上和我们在现实世界中使用字典查字义的方法一样
Swift 的Dictionary类型被桥接到Foundation的NSDictionary类。

 */

// 字典类型快捷语法
/*
  Swift 的字典使用Dictionary<Key, Value>定义，其中Key是字典中键的数据类型，Value是字典中对应于这些键所存储值的数据类型。
 */

// 创建一个空字典
var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

// 用字典字面量创建字典

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// 访问和修改字典
print("The dictionary of airports contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty")
} else {
    print("The airports dictionary is not empty")
}

airports["LHR"] = "London"

airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

airports["APL"] = "Apple Internation"
// "Apple Internation" 不是真的 APL 机场, 删除它
airports["APL"] = nil
// APL 现在被移除了

if let removedValue = airports.removeValueForKey("DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
// prints "The removed airport's name is Dubl


// 字典遍历
for(airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code:\(airportCode)")
}

for airportName in airports.values {
    print("Airport Name: \(airportName)")
}

let airportCodes = [String](airports.keys)

let airportNames = [String](airports.values)