
//===================================
//       Nested Types in Action
//===================================
struct BlackjackCard {
    enum Suit: Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 1)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

//===================================
//     Referring to Nested Types
//===================================
let theJackOfSpades = BlackjackCard(rank: .Jack, suit: .Spades)
print("theJackOfSpades: \(theJackOfSpades.description)")

let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
print("theAceOfSpades: \(theAceOfSpades.description)")

let theKingOfSpades = BlackjackCard(rank: .King, suit: .Clubs)
print("theKingOfSpades: \(theKingOfSpades.description)")
