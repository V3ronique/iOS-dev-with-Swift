//: [Previous](@previous)

import Foundation

// MARK: - Optionals
var occupation = "Professor at Hogwarts"
occupation = ""

var errorCode: Int?
errorCode = 100
errorCode = nil

var result: Int? = 30
print(result) // we have this warning here because the compiler knows that we need to unwrap the optional
//print(result + 1) // uncomment to receive an error
print(result!) // not safe to do
result = nil // comment and uncomment this line to check what happens with the optional binding examples
//print(result!) // you can see why here - just uncomment and run

// Dummy optional check
if result != nil {
    print(result!)
} else {
    print("No result :(")
}

// dummy optional binding with if
if let unwrappedResult = result {
    print(unwrappedResult)
} else {
    print("No result :(")
}

// optional binding with if as we normally do it
if let result = result {
    print(result)
} else {
    print("No result :(")
}

// guard statement
func guardMyCastle(name: String?) {
  guard let castleName = name else {
    print("No castle!")
    return
  }
  
  // At this point, `castleName` is a non-optional String
  print("Your castle called \(castleName) was guarded!")
}

// nil coalescing
let nilCoalescingResult = result ?? 0
