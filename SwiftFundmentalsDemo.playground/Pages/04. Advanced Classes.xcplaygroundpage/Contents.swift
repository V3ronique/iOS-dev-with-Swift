struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    deinit {
        print("\(firstName) \(lastName) was deinitialized!")
    }
}

class Student: Person {
    var grades: [Grade] = []
    
    required init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    init(firstName: String, lastName: String, grades: [Grade]) {
        self.grades = grades
        super.init(firstName: firstName, lastName: lastName)
    }
    
    convenience init(transfer: Student) {
        self.init(firstName: transfer.firstName, lastName: transfer.lastName, grades: transfer.grades)
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

class BandMember: Student {
    var minimumPracticeTime = 2
}

class OboePlayer: BandMember {
    override var minimumPracticeTime: Int {
        get {
            super.minimumPracticeTime * 2
        }
        set {
            super.minimumPracticeTime = newValue / 2
        }
    }
}

let john = Person(firstName: "Johnny", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")

john.firstName // "John"
jane.firstName // "Jane"

let history = Grade(letter: "B", points: 9.0, credits: 3.0)
jane.recordGrade(history)
// john.recordGrade(history) // john is not a student!

// Polymophism
func phonebookName(_ person: Person) -> String {
    "\(person.lastName), \(person.firstName)"
}

let person = Person(firstName: "Johnny", lastName: "Appleseed")
let oboePlayer = OboePlayer(firstName: "Jane",
                            lastName: "Appleseed")

phonebookName(person) // Appleseed, Johnny
phonebookName(oboePlayer) // Appleseed, Jane

// runtime checks
var hallMonitor = Student(firstName: "Jill",
                          lastName: "Bananapeel")
hallMonitor = oboePlayer

if let hallMonitor = hallMonitor as? BandMember {
    print("This hall monitor is a band member and practices at least \(hallMonitor.minimumPracticeTime) hours per week.")
}

// Equatable
extension Person {
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
}

extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(firstName)
        hasher.combine(lastName)
    }
}

// Comparable
extension Student: Comparable {
    static func < (lhs: Student, rhs: Student) -> Bool {
        lhs.grades.reduce(0) {
            $0 + $1.points
            } < rhs.grades.reduce(0) {
                $0 + $1.points
        }
    }
}

var grades = [Grade(letter: "A", points: 100, credits: 6),
              Grade(letter: "A", points: 95, credits: 6),
              Grade(letter: "A", points: 100, credits: 6),
              Grade(letter: "A", points: 100, credits: 6)]

let student1 = Student(firstName: "Annie", lastName: "Wilson", grades: grades)
grades.append(Grade(letter: "A", points: 100, credits: 6))
let student2 = Student(firstName: "Billy", lastName: "Jean", grades: grades)

student1 == student2
student1 < student2

let classOfStudents = [student1, student2]
classOfStudents.sorted(by: >)
print(classOfStudents)
