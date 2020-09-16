enum Direction {
    case north
    case south
    case east
    case west
}

enum Season: String {
    case spring, summer, autumn, winter
}

enum Month {
    case january, february, march, april, may, june, jully, august, september, october, november, december
    
    func semester() -> Season {
        switch self {
        case .june, .jully, .august:
            return .summer
        case .september, .october, .november:
            return .autumn
        case .december, .january, .february:
            return .winter
        case .march, .april, .may:
            return .spring
        }
    }
}

// with associated types
var balance = 5000

func withdraw(_ amount: Int) {
    balance -= amount
}

enum WithdrawalResult {
    case success(newBalance: Int)
    case error(message: String)
}

func withdraw(amount: Int) -> WithdrawalResult {
    if amount <= balance {
        balance -= amount
        return .success(newBalance: balance)
    } else {
        return .error(message: "Not enough money!")
    }
}

let result = withdraw(amount: 1000)

switch result {
case .success(let newBalance):
    print("Your new balance is: \(newBalance)")
case .error(let message):
    print(message)
}

// Uninhibited enum
enum Math {
    static func factorial(of number: Int) -> Int {
        (1...number).reduce(1, *)
    }
}

Math.factorial(of: 6) // 720

// That's how optionals work ... sort of
var age: Int?
age = 17
age = nil

switch age {
case .none:
    print("No value")
case .some(let value):
    print("Got a value: \(value)")
}

let optionalNil: Int? = .none
optionalNil == nil    // true
optionalNil == .none  // true
