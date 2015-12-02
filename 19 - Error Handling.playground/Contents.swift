
//==================
//   表示并抛出错误
//==================
enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

// throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)

//=============
//   处理错误
//=============

// 用throwing 函数传递错误
/*
  func canThrowErrors() throws -> String
  func cannotThrowErrors() -> String
*/

struct  Item {
    var price: Int
    var count: Int
}
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDesposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name:String) throws {
        guard var item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDesposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDesposited)
        }
        
        coinsDesposited -= item.price
        --item.count
        inventory[name] = item
        dispenseSnack(name)
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

// 用Do-Catch处理错误
/*
do {
    try extension
    statements
} catch pattern 1 {
    statements
} catch pattern 2 where condition {
    statements
}
*/
var vendingMachine = VendingMachine()
vendingMachine.coinsDesposited = 8
do {
    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

// 将错误转换成可选值
func someThrowingFunction() throws -> Int {
    return 0
}

let x = try? someThrowingFunction()
let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

// 禁用错误传递
/*
 let photo = try! loadImage("./Resources/John Appleseed.jpg")
*/

//================
//   指定清理操作
//================

/*
可以使用defer语句在即将离开当前代码块时执行一系列语句。

可以使用defer语句在即将离开当前代码块时执行一系列语句。该语句让你能执行一些必要的清理工作，不管是以何种方式离开当前代码块的——无论是由于抛出错误而离开，还是由于诸如return或者break的语句。例如，你可以用defer语句来确保文件描述符得以关闭，以及手动分配的内存得以释放。

defer语句将代码的执行延迟到当前的作用域退出之前。该语句由defer关键字和要被延迟执行的语句组成。延迟执行的语句不能包含任何控制转移语句，例如break或是return语句，或是抛出一个错误。延迟执行的操作会按照它们被指定时的顺序的相反顺序执行——也就是说，第一条defer语句中的代码会在第二条defer语句中的代码被执行之后才执行，以此类推。


func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // 处理文件
        }
        // close(file) 会在这里被调用，即作用域的最后。
    }
}
*/