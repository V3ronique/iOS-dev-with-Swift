import Foundation

protocol Account {
    associatedtype Currency
    
    var balance: Currency { get }
    func deposit(amount: Currency)
    func withdraw(amount: Currency)
}

public typealias Dollars = Double

/// A U.S. Dollar based "basic" account.
public class BasicAccount: Account {
    
    private (set) var balance: Dollars = 0.0
    
    public init() { }
    
   public func deposit(amount: Dollars) {
        balance += amount
    }
    
    public func withdraw(amount: Dollars) {
        if amount <= balance {
            balance -= amount
        } else {
            balance = 0
        }
    }
}
