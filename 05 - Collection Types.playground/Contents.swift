//===============================
//   Mutability of Collections
//===============================


//============
//   Arrays
//============

// Array Type Shorthand Syntax:  Array<Element>

// Creating an Empty Array
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items")

someInts.append(3)
someInts = []

// Creating an Array with a Deafult Value
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)

// Creating an Array by Adding Two Arrays Together
var antherThreeDoubles = Array(count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + antherThreeDoubles

// Creating an Array with an Array Literal
var shoppingList:[String] = ["Eggs", "Milk"]

// Accessing and Modifying an Array
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

// Iterating Over an Array
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("Item \(String(index + 1)): \(value)")
}


//==========
//   Sets
//==========

// Hash Valus for Set Types
/*
   a == a
   a == b / b == a
   a == b / b == c / a == c
 */


// Set Type Syntax: Set<Elment>

// Creating and Initializing an Empty Set
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items")
letters.insert("a")
letters = []

// Creating a Set with an Array Literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

// Accessing and Modifying a Set
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

// Iterating Over a Set
for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sort() {
    print("\(genre)")
}

//===============================
//   Performing Set Operations
//===============================

// fundamental Set Operations
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(evenDigits).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

// Set Membership and Equality
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSubsetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)

//==================
//   Dictionaries
//==================

// Dictionary Type shorthand Syntax: Dictionary<Key,Value>

// Creating an Empty Dictionary
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

// Creating a Dictionary with a Dictionary Literal
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// Accessing and Modifying a Dictionary
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
airports["APL"] = nil

if let removedValue = airports.removeValueForKey("DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

// Iterating Over a Dictionary
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
