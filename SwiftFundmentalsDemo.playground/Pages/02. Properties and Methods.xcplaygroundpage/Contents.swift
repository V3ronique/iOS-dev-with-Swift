struct TV {
    var width: Double
    var height: Double
    var diagonal: Int {
        get {
            let result = (height * height +
                width * width).squareRoot().rounded()
            return Int(result)
        } set {
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            
            let ratioDiagonal = (ratioWidth * ratioWidth +
                ratioHeight * ratioHeight).squareRoot()
            height = Double(newValue) * ratioHeight / ratioDiagonal
            width = height * ratioWidth / ratioHeight
        }
    }
}

let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

struct SimpleDate {
    var month: String = "January"
    var day: Int = 1
    
    func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
        months.firstIndex(of: "December")! -
            months.firstIndex(of: date.month)!
    }
    
    func monthsUntilWinterBreak() -> Int {
        months.firstIndex(of: "December")! -
            months.firstIndex(of: self.month)!
    }
    
    mutating func advance() {
        day += 1
    }
}

extension SimpleDate {
    init(month: Int, day: Int) {
        self.month = months[month-1]
        self.day = day
    }
}


let date = SimpleDate(month: "October", day: 1)
date.monthsUntilWinterBreak(from: date) // 2

func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
    months.firstIndex(of: "December")! -
        months.firstIndex(of: date.month)!
}

let date2 = SimpleDate()
date2.month // January
date2.monthsUntilWinterBreak() // 11


struct Math {
    static func factorial(of number: Int) -> Int {
        (1...number).reduce(1, *)
    }
}

Math.factorial(of: 6) // 720

// number -> if % n == 0 ->
extension Math {
    static func primeFactors(of value: Int) -> [Int] {
        var remainingValue = value
        var testFactor = 2
        var primes: [Int] = []
        
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            } else {
                testFactor += 1
            }
        }
        
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        
        return primes
    }
}
