//: [Previous](@previous)

import Foundation

// MARK: - Type Inference
var someNumber = 10
//someNumber = 12.5 -> uncomment for a juicy error

// MARK: - Type Annotation
var anotherVariable: Double = 10 // play with me - remove the type anotation and type 10.0 instead
anotherVariable = 12.5

// MARK: - Strings
var message = "Hi! " + "My name is "
let name = "Slim Shady"
message += name
let exclamationMark: Character = "!"
message += String(exclamationMark)

// MARK: - String Interpolation
let messageWithInterpolation = "Hi! My name is \(name)!"
let anotherMessageWithInterpolation = "We can use it for any type like that: \(1.0 / 3.0)"

// MARK: - Multiline String
let multilineString = """
May I have your attention, please?
Will the real Slim Shady please stand up?
I repeat, will the real Slim Shady please stand up?
We're gonna have a problem here
"""

print(multilineString)

// MARK: - Tuples
let coordinates: (Int, Int) = (2, 3) // we have type annotation here, we may remove it
let coordinatesWithInference = (2, 3)
let doubleCoordinatesInference = (2.1, 3.5)
let mixedTypeCoordinates = (2.1, 3)

// this is how we get values from unnamed tupe
let x1 = coordinates.0
let y1 = coordinates.1

let namedCoordinates = (x: 2, y: 2)
// ... and from named
let x2 = namedCoordinates.x
let y2 = namedCoordinates.y

// ... and named with 3 values
let coordinates3D = (x: 2, y: 3, z: 1)
let (x3, y3, _) = coordinates3D
print("Coordinates X: \(x3) and Y: \(y3)")

// MARK: - Typealias
typealias Coordinates = (x: Int, y: Int) // I a just a fancy nickname, nothing more
let coordinatesFromAlias: Coordinates = (2, 3) // we need the annotation here so that we can use the tuple names defined in the alias
let x4 = coordinatesFromAlias.x
let y4 = coordinatesFromAlias.y
