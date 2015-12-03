
//=====================
//   String Literals
//=====================

let someString = "Some string literal value"

//==================================
//   Initializing an Empty String
//==================================

var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}

//==================================
//       String Mutability
//==================================

var variableString = "Horse"
variableString += " and carriage"

//==================================
//     String Are Value Types
//==================================

// value copy

//==================================
//     Working with Characters
//==================================

for character in "Dog!🐶".characters {
    print(character)
}

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

//=========================================
//  Concatenating Strings and Characters
//=========================================

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let exclamationMark1: Character = "!"
welcome.append(exclamationMark1)

//=========================================
//          String Interpolation
//=========================================

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//===============
//   Unicode
//===============

// Unicode Scalars
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imageination is more important than knowledge" - Enistein
let dollarSign = "\u{24}"             // $, Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥, Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖, Unicode 标量 U+1F496

// Extended Grapheme Clusters
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


//=========================
//   Counting Characters
//=========================

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.characters.count)")

//======================================
//   Accessing and Modifying a String
//======================================

// String Indices
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
let index = greeting.startIndex.advancedBy(7)
greeting[index]

for index in greeting.characters.indices {
    print("\(greeting[index])", terminator: " ")
}

// Inserting and Removing
var welcome1 = "hello"
welcome1.insert("!", atIndex: welcome1.endIndex)
welcome1.insertContentsOf(" there".characters, at: welcome1.endIndex.predecessor())

welcome1.removeAtIndex(welcome1.endIndex.predecessor())

let range = welcome1.endIndex.advancedBy(-6)..<welcome1.endIndex
welcome1.removeRange(range)

//=======================
//   Comparing Strings
//=======================

// String and Character Equality
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

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}

// Prefix and Suffix Equality
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

//=======================================
//   Unicode Representations of String
//=======================================

// utf-8 Representation
let dogString = "Dog‼🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit)",terminator:"")
}

// utf-16 Representation
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}


