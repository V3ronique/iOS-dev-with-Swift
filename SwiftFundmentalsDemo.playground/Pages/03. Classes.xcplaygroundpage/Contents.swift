class Person {
    var firstName: String
    var lastName: String
    var age: Int = 30
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    // mutating example
    func turnOld() {
        age += 1
    }
}

let john = Person(firstName: "Johnny", lastName: "Walker")
var walker = john

john.firstName = "John"
print(john.firstName)
print(walker.firstName)

john === walker

let imposterJohn = Person(firstName: "John", lastName: "Walker")
john === imposterJohn

walker = imposterJohn


// Create fake, imposter Johns. Use === to see if any of these imposters are our real John.
var imposters = (0...100).map { _ in
    Person(firstName: "John", lastName: "Walker")
}

// Equality (==) is not effective when John cannot be identified by his name alone
imposters.contains {
    $0.firstName == john.firstName && $0.lastName == john.lastName
} // true

// Check to ensure the real John is not found among the imposters.
imposters.contains {
    $0 === john
} // false

// Now hide the "real" John somewhere among the imposters.
imposters.insert(john, at: Int.random(in: 0..<100))

// John can now be found among the imposters.
imposters.contains {
    $0 === john
} // true

// Since `Person` is a reference type, you can use === to grab the real John out of the list of imposters and modify the value.
// The original `john` variable will print the new last name!
if let indexOfJohn = imposters.firstIndex(where:
    { $0 === john }) {
    imposters[indexOfJohn].lastName = "Driver"
}

john.fullName // John Driver
