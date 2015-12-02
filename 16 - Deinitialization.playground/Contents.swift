
//================
//   析构过程原理
//================

// 析构过程原理

/*
  deinit {
    // 执行析构过程
  }
 */

//================
//   析构器实践
//================
class Bank {
    static var coinsInBank = 10_000
    static func vendCoins(var numberOfCoinToVend: Int) -> Int {
        numberOfCoinToVend = min(numberOfCoinToVend, coinsInBank)
        coinsInBank -= numberOfCoinToVend
        return numberOfCoinToVend
    }
    
    static func receiveCoins(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit {
        Bank.receiveCoins(coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
playerOne!.coinsInPurse
Bank.coinsInBank

playerOne!.winCoins(2_000)
playerOne!.coinsInPurse
Bank.coinsInBank

playerOne = nil
Bank.coinsInBank











