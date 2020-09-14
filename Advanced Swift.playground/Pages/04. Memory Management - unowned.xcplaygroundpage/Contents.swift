class Course {
    var title: String
    unowned var teacher: Teacher
    var students: [Student] = []
    
    lazy var description: () -> String = {
        [weak self] in
        
        guard let self = self else {
            return "This course is no longer available"
        }
        
        return "\(self.title) by \(self.teacher.name)"
    }
    
    init(_ title: String, teacher: Teacher) {
        self.title = title
        self.teacher = teacher
    }
    
    deinit {
         print("\(title) ended!")
    }
}

class Academic {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

class Teacher: Academic {
    var course: Course?
    
    override init(_ name: String) {
        super.init(name)
    }
    
    deinit {
        print("\(name) is no longer teaching \(course?.title ?? "")")
    }
}

class Student: Academic {
    var course: Course

    init(_ name: String = "Anonymous", course: Course) {
        self.course = course
        super.init(name)
    }
    
    deinit {
        print("\(name) is no longer studying \(course.title)")
    }
}

enum Alphabeth: String, CaseIterable {
    case a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
}

do {
    var students: [Student] = []
    let teacher = Teacher("Veronika")
    let course = Course("iOS Development with Swift", teacher: teacher)
    for letter in Alphabeth.allCases {
        let student = Student(letter.rawValue, course: course)
        students.append(student)
    }
    
    teacher.course = course
    students.forEach { $0.course = course }
    print(course.description())
}


