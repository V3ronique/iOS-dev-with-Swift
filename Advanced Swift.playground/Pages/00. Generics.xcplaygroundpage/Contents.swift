protocol Pet {
    var name: String { get }  // all pets respond to a name
}

class Cat: Pet {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
class Dog: Pet {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Keeper<Animal: Pet> {
    var name: String
    var morningCare: Animal
    var afternoonCare: Animal
    
    init(name: String, morningCare: Animal, afternoonCare: Animal) {
        self.name = name
        self.morningCare = morningCare
        self.afternoonCare = afternoonCare
    }
}

let jason = Keeper(name: "Jason",
                   morningCare: Cat(name: "Whiskers"),
                   afternoonCare: Cat(name: "Sleepy"))

// conditional conformance
protocol Meowable {
    func meow()
}

extension Cat: Meowable {
    func meow() {
        print("\(self.name) says meow!")
    }
}

extension Array: Meowable where Element: Meowable {
    func meow() {
        forEach { $0.meow() }
    }
}

let optional: Optional<Int> = 3
