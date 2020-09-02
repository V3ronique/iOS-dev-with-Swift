//: [Previous](@)

import Foundation

// MARK: - Control Flows
let animal = "Fox"

if animal == "Cat" {
    print("Animal is a house pet")
} else {
    print("This is some animal")
}

let hourOfDay = 12
var timeOfDay = ""

// Ifs execute the first statement that is true
if hourOfDay < 6 {
  timeOfDay = "Early morning"
} else if hourOfDay < 12 {
  timeOfDay = "Morning"
} else if hourOfDay < 17 {
  timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
  timeOfDay = "Evening"
} else if hourOfDay < 24 {
  timeOfDay = "Late evening"
} else {
  timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)

// ternary operator, does the same as ...
/*
    if hourOfDay < 12 {
        beverage = "Coffee"
    } else {
        beverage = "Beer"
    }
 */
let beverage = hourOfDay < 12 ? "Coffee" : "Beer"
print(beverage)

// while
var sum = 1
while sum < 1000 {
    sum = 2 * sum + 1
}

// repeat while
var anotherSum = 1
repeat {
    anotherSum = 2 * anotherSum + 1
} while anotherSum < 1000

// we are guaranteed that the repeat while will execute at least once
repeat {
    sum = 2 * sum + 1
} while sum < 1000

// breaking the loop
var thirdSum = 1
while true {
    thirdSum = thirdSum * 2 + 1
    
    if thirdSum >= 1000 {
        break
    }
}

// ranges
let closedRange = 0...6
let halfOpenRange = 0..<7

// Random
while Int.random(in: 1...6) != 6 { // try to replace 1...6 with the constants above
    print("Not a six")
}

// plain old for loop
let count = 10
var forLoopSum = 0

for i in 1...count {
    forLoopSum += i
}

// for loop where we don't need the loop constant (no i, instead _)
forLoopSum = 1
var lastSum = 0

for _ in 0..<count {
    let temp = forLoopSum
    forLoopSum = forLoopSum + lastSum
    lastSum = temp
}

// where clause for odd numbers
forLoopSum = 0
for i in 0...count where i % 2 == 1 {
    forLoopSum += i
}

/*
 0  |  0  |  0  |  0  |  0  |  0  |  0  |  0
 --------------------------------------------
 0  |  1  |  2  |  3  |  4  |  5  |  6  |  7
 --------------------------------------------
 0  |  2  |  4  |  6  |  8  |  10 |  12 |  14
 --------------------------------------------
 0  |  3  |  6  |  9  |  12 |  15 |  18 |  21
 --------------------------------------------
 0  |  4  |  8  |  12 |  16 |  20 |  24 |  28
 --------------------------------------------
 0  |  5  |  10 |  15 |  20 |  25 |  30 |  35
 --------------------------------------------
 0  |  6  |  12 |  18 |  24 |  30 |  36 |  42
 --------------------------------------------
 0  |  7  |  14 |  21 |  28 |  35 |  42 |  49
 */

// for loop with continue
forLoopSum = 0
for row in 0..<8 {
    if row % 2 == 0 {
        continue
    }
    
    for column in 0..<8 {
        sum += row * column
    }
}

// labeled for loops, see rowLoop: and columnLoop:
forLoopSum = 0
rowLoop: for row in 0..<8 {
    columnLoop: for column in 0..<8 {
        if row == column {
            continue rowLoop
        }
        
        forLoopSum += row * column
    }
}

// switch
switch hourOfDay {
case 0...5:
    timeOfDay = "Early morning"
case 6..<12:
    timeOfDay = "Morning"
case 12, 13, 14, 15, 16:
    timeOfDay = "Afternoon"
case 17, 18, 19:
    timeOfDay = "Evening"
case 20, 21, 22, 23:
    timeOfDay = "Late evening"
default:
    timeOfDay = "Invalid hour"
}

// pattern matching
var number = 3
switch number {
case let x where x % 2 == 0: // Replace with _
    print("Even")
default:
    print("Odd")
}

let coordinates3D = (x: 2, y: 3, z: 1)

// partial matching
switch coordinates3D {
case (0, 0, 0):
  print("Origin")
case (_, 0, 0):
  print("On the x-axis.")
case (0, _, 0):
  print("On the y-axis.")
case (0, 0, _):
  print("On the z-axis.")
default:
  print("Somewhere in space")
}

switch coordinates3D {
case (0, 0, 0):
  print("Origin")
case (let x, 0, 0):
  print("On the x-axis at x = \(x)")
case (0, let y, 0):
  print("On the y-axis at y = \(y)")
case (0, 0, let z):
  print("On the z-axis at z = \(z)")
case let (x, y, z):
  print("Somewhere in space at x = \(x), y = \(y), z = \(z)")
}

switch coordinates3D {
case let (x, y, _) where y == x:
  print("Along the y = x line.")
case let (x, y, _) where y == x * x:
  print("Along the y = x^2 line.")
default:
  break
}
