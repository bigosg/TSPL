
//=======================================
//    The Problem That Generics Solve
//=======================================

func swapTwoInts(inout a:Int, inout _ b: Int) {
    let tempraryA = a
    a = b
    b = tempraryA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoStrings(inout a: String, inout _ b: String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(inout a: Double, inout _ b: Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//=======================================
//           Generic Functions
//=======================================

func swapTwoValues<T>(inout a: T, inout _ b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someGenInt = 3
var anotherGenInt = 107
swapTwoValues(&someGenInt, &anotherGenInt)
someGenInt
anotherGenInt

var someGenString = "hello"
var anotherGenString = "world"
swapTwoValues(&someGenString, &anotherGenString)
someGenString
anotherGenString

//=======================================
//         Naming Type Parameters
//=======================================

// Always give type parameters UpperCamelCase names (such as T and KeyType)
// to indicate that they are a placeholder for a type, not a value.


//=======================================
//             Generic Types
//=======================================
struct IntStack {
    var items = [Int]()
    mutating func push (item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}


struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

let fromTheTop = stackOfStrings.pop()
fromTheTop

//=======================================
//       Extending a Generic Type
//=======================================

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}

//=======================================
//            Type Constraints
//=======================================

// Type constraint syntax
class someClass{}
protocol someProtocol{}

func someFunction<T: someClass, U: someProtocol> (someT: T, someU: U) {
    // class body
}

// Type constraints in action
func findStringIndex(array: [String], _ valueToFind: String) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findStringIndex(strings, "llama") {
    print("The index of llama is \(foundIndex)")
}

func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let doubleIndex  = findIndex([3.14159, 0.1, 0.25], 9.3)
let stringIndex = findIndex(["Mike", "Malcolm", "Andrea"], "Andrea")

//=======================================
//           Associated Types
//=======================================

protocol Container {
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntAssociatedTypedStack: Container {
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    typealias ItemType = Int
    mutating  func append(item: ItemType) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct AssociatedTypedStack<Element>: Container {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func append(item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

// Extending an existing type to specify an associated type
extension Array: Container {}

//=======================================
//            Where Clauses
//=======================================
func allItemsMatch<C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>(someContainer: C1, _ anotherContainer: C2) -> Bool {
    if someContainer.count != anotherContainer.count {
        return false
    }
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    return true
}

var whereClauseStackOfStrings = AssociatedTypedStack<String>()
whereClauseStackOfStrings.push("uno")
whereClauseStackOfStrings.push("dos")
whereClauseStackOfStrings.push("tres")

var whereClauseArrayOfStrings = ["uno", "dos", "tres"]
if allItemsMatch(whereClauseStackOfStrings, whereClauseArrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}

















