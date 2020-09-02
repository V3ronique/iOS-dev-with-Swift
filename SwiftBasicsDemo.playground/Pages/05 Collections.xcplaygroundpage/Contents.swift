//: [Previous](@previous)

import Foundation

// MARK: - Arrays
let evenNumbers = [2, 4, 6, 8]
//evenNumbers += ["ten"] // uncomment for an error

// empty array -> requires type annotation
var subscribers: [String] = []

// with repeating elements
let allZeros = Array(repeating: 0, count: 5)

var players = ["Arya", "Brandon", "Catelyn", "Eddard"]
// check for empty
players.isEmpty

// check for count
if players.count < 2 {
    print("There must always be a Stark at Winterfell!")
} else {
    print("When you play the game of thrones, you win or you die. There is no middle ground.")
}
// first player
var currentPlayer = players.first
print(currentPlayer as Any) // as Any because it's optional
print(players.last as Any) // last player, again optional
currentPlayer = players.min() // takes the minimal element, if it's string - alphabetically
print(currentPlayer as Any)

if let currentPlayer = currentPlayer {
    print("\(currentPlayer) will start")
}

var firtsPlayer = players[0]
//var player = players[4] //-> uncomment me for crash
let upcomingPlayers = players[1...2] // with closed range, ArraySlice
print(upcomingPlayers[1], upcomingPlayers[2])
let uplcomingPlayersArray = Array(upcomingPlayers)
print(uplcomingPlayersArray[0], upcomingPlayers[1])

// check if the array contains a player
func isEliminated(player: String) -> Bool {
    !players.contains(player) // returns true if the array contains it
}

print(isEliminated(player: "Brandon"))
players[1...3].contains("Brandon") // check with range

//we add to the array like that
players.append("Jon")
players += ["Robb"]
print(players)

// and we insert at index like that
players.insert("Ricon", at: 5)

// remove like that
var removedPlayer = players.removeLast()
print("\(removedPlayer) was beheaded")
removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was slaughtered")

// awww shoot, spoiler alert - Jon is a Targaryen
if let index = players.firstIndex(of: "Jon") {
    players[index] = "Aegon"
}

// we add more players for a given range
players[0...1] = ["Sansa", "Benjen", "Lyanna", "Rickard"]
print(players)
//we remove at index
let playerAegon = players.remove(at: 5)
players.insert(playerAegon, at: 0)
print(players)
// swap is super nice, it takes O(1) time ^^
players.swapAt(1, 2)
players.sort()

// we can iterate with for loop
for player in players {
    print(player)
}

// ... and like so as well
for (index, player) in players.enumerated() {
    print("\(index + 1). \(player)")
}

// we can sum some array
func sumOfElements(in array: [Int]) -> Int {
    var sum = 0
    for number in array {
        sum += number
    }
    
    return sum
}

// MARK: - Dictionaries
var namesAndOrder = ["Arya": 3, "Brandon": 4, "Jon": 1, "Ricon": 5, "Robb": 1]
print(namesAndOrder)
//namesAndOrder = [:] // uncomment for error
//namesAndOrder.reserveCapacity(10) // we reserve capacity
print(namesAndOrder["Arya"]!) // we can use subscript with the dictionary key, it returns optional
namesAndOrder["Theon"]

namesAndOrder.isEmpty
namesAndOrder.count

var theonData = [
    "name": "Theon",
    "familly name": "Greyjoy",
    "profession": "Prince",
    "address": "Iron Islands"
]

// we update like so
theonData.updateValue("Moto", forKey: "What is dead may never die!")
theonData["address"] = "Wintefell"
theonData.updateValue("Reek", forKey: "name")
// we can remove like so
theonData.removeValue(forKey: "familly name")
theonData["profession"] = nil

// For the cirious: try creating Dictionary with optionals for value and try to update the value of something with nil -> use update and then try with subscript

// how we iterate on dictionaries
for (player, order) in namesAndOrder {
    print("\(player) - \(order)")
}

//how we iterate only on keys
for player in namesAndOrder.keys {
    print("\(player), ", terminator: "")
}

// MARK: - Sets
let set: Set<Int> = [1]
let someArray = [1, 2, 3, 1]
var explicitSet: Set<Int> = [1, 2, 3, 1]
var someSet = Set([1, 2, 3, 1])
print(someSet)

someSet.contains(1)
someSet.contains(4)
someSet.insert(5)
if let removedElement = someSet.remove(1) {
    print(removedElement)
}
