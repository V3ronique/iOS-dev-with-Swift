//: [Previous](@previous)

import Foundation

// MARK: - Functions
let message = "Hello, functions"
// no params, no return value
func printMyName() {
    print(message)
}

// how we call the function
printMyName()

// with param
func printMultipleOfFive(value: Int) {
    print("\(value) * 5 = \(value * 5)")
}

printMultipleOfFive(value: 10)

// Dummy way - read me aloud
func printMultipleOf(multiplier: Int, andValue: Int) {
    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}

printMultipleOf(multiplier: 4, andValue: 2)

// with external name for the second param
func printMultipleOf(multiplier: Int, and value: Int) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}

printMultipleOf(multiplier: 4, and: 2)

// with wildcard operator and default value
func printMultipleOf(_ multiplier: Int = 2, and value: Int) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}

// call with both params
printMultipleOf(4, and: 2)
// call with just the unknown parameter
printMultipleOf(and: 2)

// with return value
func multiply(_ number: Int, by multiplier: Int) -> Int {
    // when the function has just one statement we don't need the return
    // return number * multiplier - does the same as:
    number * multiplier
}

multiply(4, by: 2)

// multiple return values
func multiplyAndDivide(_ number: Int, by factor: Int)
                   -> (product: Int, quotient: Int) {
   (number * factor, number / factor)
}

let results = multiplyAndDivide(4, by: 2) // this is a tuple
let product = results.product // this is the first value
let quotient = results.quotient // this is the second value

// inout - we use it so that the parameter is not a constant
func incrementAndPrint(_ value: inout Int) {
  value += 1
  print(value)
}

// we call it like that
var inoutValue = 1
incrementAndPrint(&inoutValue)

// we assign the multiply function to a variable
var function = multiply
function(2, 3)

// we can pass functions as another's function params
func printRsult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}

printRsult(function, 4, 5)
