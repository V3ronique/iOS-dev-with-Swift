//: [Previous](@previous)

import Foundation

// MARK: - Closure
// how to define
var multiplyClosure: (Int, Int) -> Int
multiplyClosure = { (a: Int, b: Int) -> Int in
    return a * b
}

// how to call
multiplyClosure(2, 3)

// simplify syntax
multiplyClosure = { (a: Int, b: Int) -> Int in
     a * b
}

// simplify further
multiplyClosure = { (a, b) in
    return a * b
}

multiplyClosure(2, 3)

// make anonymous parameters
multiplyClosure = {
    $0 * $1
}

multiplyClosure(2, 3)

// as function parameters
func operateOnNumbers(_ a: Int, _ b: Int,
                      operation: (Int, Int) -> Int) -> Int {
  let result = operation(a, b)
  print(result)
  return result
}

operateOnNumbers(2, 3, operation: multiplyClosure)

// inline syntax
operateOnNumbers(3, 2, operation: { (a: Int, b: Int) -> Int in
  return a + b
})

// shorter
operateOnNumbers(2, 3, operation: { $0 + $1 })

// even shorter
operateOnNumbers(2, 3, operation: +)

// trailing closure
operateOnNumbers(2, 3) {
    $0 + $1
}

// no return value
let voidClosure: () -> Void = {
    print("For the night is dark and full of terrors!")
}

voidClosure()

var counter = 0
let incrementCounter = {
  counter += 1
}

incrementCounter()
print(counter)
incrementCounter()
print(counter)
incrementCounter()
print(counter)
incrementCounter()
print(counter)
incrementCounter()
print(counter)

func countingClosure() -> () -> Int {
  var counter = 0
  let incrementCounter: () -> Int = {
    counter += 1
    return counter
  }
  return incrementCounter
}

let incrementCounter2 = countingClosure()
let incrementCounter3 = countingClosure()


incrementCounter2()
incrementCounter3()
incrementCounter2()
incrementCounter3()
incrementCounter2()

// sorting
let players = ["Arya", "Brandon", "Catelyn", "Eddard", "Ricon", "Robb", "Sansa"]
players.sorted {
    $0.count > $1.count
}

// closure on collections
var values = [1, 2, 3, 4, 5, 6]
values.forEach {
    print("\($0): \($0 * $0)")
}

// filter - if the condition is tru, it appends the value in a new array
let starkGirls = players.filter {
    $0.last == "a"
}

print(starkGirls)

// first with condition
let firstGirl = players.first {
    $0.last == "a"
}

// we create a new collection here
let playersWithFamilyName = players.map {
    $0 + " Stark"
}

let userInput = ["0", "11", "haha", "42"]

// this map returns collections of optionals
let numbers1 = userInput.map {
  Int($0)
}

// this returns collection of non-optionals, it ignores the problematic values
let numbers2 = userInput.compactMap {
    Int($0)
}

// reduces to sum, takes to params, first one is the value that we give to the reduce and the second is the first value from the array; afterwards reduce returns 1 value, which is given again to the reduce and the second parameter is the second value from the array ... and so on
let sumFromReduce = numbers2.reduce(0) {
    $0 + $1
}

// again, reduce
let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]
let stockSum = stock.reduce(0) {
  $0 + $1.key * Double($1.value)
}

// reduce into -> from dictionary to an array
let farmAnimals = ["🐎": 5, "🐄": 10, "🐑": 50, "🐶": 1]
var allAnimals = farmAnimals.reduce(into: []) {
  (result, this: (key: String, value: Int)) in
  for _ in 0 ..< this.value {
    result.append(this.key)
  }
}
//print(allAnimals) // uncomment, it's just for fun

// drop -> creates new array without the dropped values
let removeFirstAnimal = allAnimals.dropFirst()
let removeNextTwoAnimals = allAnimals.dropFirst(2)

// prefix/sufix - return the first n/last n elements
let firstTwo = allAnimals.prefix(2)
let lastTwo = allAnimals.suffix(2)
allAnimals.removeAll() { $0 as! String == "🐑" }

allAnimals.removeAll()

// lazy collection
func isPrime(_ number: Int) -> Bool {
  guard number != 1 else { return false }
  guard number != 2 && number != 3 else { return true }

  for i in 2...Int(Double(number).squareRoot()) {
    guard number % i != 0 else { return false }
  }

  return true
}

// uncoment for imperative way of programming
//var primes: [Int] = []
//var i = 1
//while primes.count < 10 {
//  if isPrime(i) {
//    primes.append(i)
//  }
//  i += 1
//}
//primes.forEach { print($0) }

// functional
let primes = (1...).lazy
        .filter { isPrime($0) }
        .prefix(10)
primes.forEach { print($0) }
