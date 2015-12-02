/****** 字符串字面量 ******/
let someString = "Some string literal value"

/****** 初始化空字符串 ******/
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}

/****** 字符串可变性 ******/
var variableString = "Horse"
variableString += " and carriage"

/****** 字符串是值类型 ******/
/*
    Swift 的String类型是值类型。 如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。
 */

/****** 使用字符 ******/
for character in "Dog!🐶".characters {
    print(character)
}

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

/****** 连接字符串和字符 ******/
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let exclamationMark1: Character = "!"
welcome.append(exclamationMark1)

/****** 字符串插值 ******/
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

/****** Unicode ******/

// Unicode 标量
/*
 U+0061表示小写的拉丁字母(LATIN SMALL LETTER A)("a")，U+1F425表示小鸡表情(FRONT-FACING BABY CHICK) ("🐥")。

 注意： Unicode 码位(code poing) 的范围是U+0000到U+D7FF或者U+E000到U+10FFFF。Unicode 标量不包括 Unicode 代理项(surrogate pair) 码位，其码位范围是U+D800到U+DFFF。

 字符串字面量可以包含以下特殊字符：

 转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
 Unicode 标量，写成\u{n}(u为小写)，其中n为任意一到八位十六进制数且可用的 Unicode 位码。
 */

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imageination is more important than knowledge" - Enistein
let dollarSign = "\u{24}"             // $, Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥, Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖, Unicode 标量 U+1F496

// 可扩展的字形群集
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e 后面加上  ́
// eAcute 是 é, combinedEAcute 是 é

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed 是 한, decomposed 是 한

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute 是 é⃝

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS 是 🇺🇸


/****** 计算字符数量 ******/
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
// 打印输出 "unusualMenagerie has 40 characters"

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
// 打印输出 "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.characters.count)")


/****** 访问和修改字符串 ******/

//字符串索引

/*
 使用startIndex属性可以获取一个String的第一个Character的索引。使用endIndex属性可以获取最后一个Character的后一个位置的索引。因此，endIndex属性不能作为一个字符串的有效下标。如果String是空串，startIndex和endIndex是相等的。

 通过调用String.Index的predecessor()方法，可以立即得到前面一个索引，调用successor()方法可以立即得到后面一个索引。任何一个String的索引都可以通过锁链作用的这些方法来获取另一个索引，也可以调用advancedBy(_:)方法来获取。但如果尝试获取出界的字符串索引，就会抛出一个运行时错误。
 */
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
let index = greeting.startIndex.advancedBy(7)
greeting[index]

// 使用characters属性的indices属性会创建一个包含全部索引的范围(Range)，用来在一个字符串中访问单个字符。
for index in greeting.characters.indices {
    print("\(greeting[index])", terminator: " ")
}

// 插入和删除
var welcome1 = "hello"
welcome1.insert("!", atIndex: welcome1.endIndex)
welcome1.insertContentsOf(" there".characters, at: welcome1.endIndex.predecessor())

welcome1.removeAtIndex(welcome1.endIndex.predecessor())

let range = welcome1.endIndex.advancedBy(-6)..<welcome1.endIndex
welcome1.removeRange(range)

/****** 比较字符串 ******/
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}

// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// 打印输出 "These two strings are considered equal"


let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}
// 打印 "These two characters are not equivalent"


let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        ++act1SceneCount
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// 打印输出 "There are 5 scenes in Act 1"

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        ++mansionCount
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        ++cellCount
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// 打印输出 "6 mansion scenes; 2 cell scenes"

/****** 字符串的Unicode表示形式 *******/