class Student {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

// Assignment with mixed semantics
struct Assignment {
    var author: Student
}

// Assignment with value semantics
struct AssignmentWithValueSemantics {
    private var author: Student
    var authorName: String {
        get {
            author.name
        } set {
            if isKnownUniquelyReferenced(&author) {
                author.name = authorName
            } else {
                return author = Student(newValue)
            }
        }
    }
    
    init(_ authorName: String) {
        self.author = Student(authorName)
    }
}

// without value semantics
// we create the structure
let assignment = Assignment(author: Student("Ivancho"))
// print the name
print(assignment.author.name)
// create another
var anotherAssignment = assignment
// we change the author of the another assignment
anotherAssignment.author.name = "Penka"
// the value of the original is also changed
print(assignment.author.name)

// with value semantics
// we create the struct
let valueSemanticsAssignment = AssignmentWithValueSemantics("Bratancho")
// print the authorName
print(valueSemanticsAssignment.authorName)
// create another
var anotherValueSemanticsAssignment = valueSemanticsAssignment
// assign the new authors name
anotherValueSemanticsAssignment.authorName = "Gergana"
// Yay! Different!
print(valueSemanticsAssignment.authorName)
print(anotherValueSemanticsAssignment.authorName)

