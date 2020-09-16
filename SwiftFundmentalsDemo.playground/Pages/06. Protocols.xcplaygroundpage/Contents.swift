enum Direction {
    case left
    case right
}

protocol DirectionalVehicle {
    func accelerate()
    func stop()
    func turn(_ direction: Direction)
    func description() -> String
}

protocol Account {
    var value: Double { get set }
    init(initialAmount: Double)
    init?(transferAccount: Account)
}

class BitcoinAccount: Account {
    var value: Double
    required init(initialAmount: Double) {
        value = initialAmount
    }
    required init?(transferAccount: Account) {
        guard transferAccount.value > 0.0 else {
            return nil
        }
        value = transferAccount.value
    }
}

var accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30.00)
let transferAccount = accountType.init(transferAccount: account)!

protocol Vehicle {
    func stop()
}

protocol Wheeled {
    var numberOfWheels: Int { get set }
}

// break with extensions
struct Bike: Vehicle, Wheeled {
    var numberOfWheels = 2
    
    func stop() {
        print("Bike just stopped")
    }
}

func roundAndRound(transportation: Vehicle & Wheeled) {
    transportation.stop()
    print("The brakes are being applied to \(transportation.numberOfWheels) wheels.")
}

roundAndRound(transportation: Bike())
