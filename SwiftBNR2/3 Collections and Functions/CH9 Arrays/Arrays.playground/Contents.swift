//: Chapter 9 - Arrays
//: ==================

import Cocoa

//: 🏅 Bronze Challenge

var toDoList = [
    "Take out garbage",
    "Pay bills",
    "Cross off finised items"
]

toDoList.isEmpty
//toDoList.removeAll()
//toDoList.isEmpty

//: 🏅 Silver Challenge

let start = Int(toDoList.startIndex)
let end = Int(toDoList.endIndex)

var i = end
while i > start {
    print(toDoList[--i])
}

// or repeat while

i = end
repeat {
    print(toDoList[--i])
} while i > start

// or reverse
for (index, item) in toDoList.reverse().enumerate() {
    print("\(index) \(item)")
}

//: ~ Fin ~


// var bucketList: Array<String>
// var bucketList: [String] // only declared, not initialized
// var bucktList: [String] = ["Climb Mt. Everest"] // initialized
var bucketList = ["Climb Mt. Everest"] // type inference
bucketList.append("Fly hot air baloon to Fiji")
bucketList.append("Write a great app")
bucketList.append("Go on a walkabout")
bucketList.append("Find a triple rainbow")

print(bucketList)

bucketList.removeAtIndex(1)

// Counting items in the array
bucketList.count

// Subscripting to find top three items
print(bucketList[0...2])

// Subscripting to append new info

bucketList[2].appendContentsOf(" in ")
bucketList[2] += "Scandanavia"

bucketList[0] = "Climb Mt. Kilimanjaro"

// Using a loop to append items from one array to another

var newItems = [
    "Fly hot air balloon",
    "Watch Starwars",
    "Go on a walkabout",
    "Scuba dive",
    "Find triple rainbow"
]

bucketList = [String]()

for item in newItems {
    bucketList.append(item)
}

bucketList = [String]()
bucketList += newItems

bucketList.insert("Toboggan accross Alaska", atIndex: 2)

print(bucketList)

// Array Equality

var myronsList = [
    "Fly hot air balloon",
    "Watch Starwars",
    "Go on a walkabout",
    "Scuba dive",
    "Find triple rainbow",
    "Toboggan accross Alaska"
]

let unorderedEqual = (bucketList == myronsList)

let entry = myronsList.removeLast()
myronsList.insert(entry, atIndex: 2)

let orderedEqual = (bucketList == myronsList)

// Immutable array

let lunches = [
    "Cheeseburger",
    "Veggie Pizza",
    "Chicken Ceasar Salad",
    "Black Bean Burrito",
    "Falafel wrap"
]

for (index, lunch) in lunches.enumerate() {
    print("\(index) \(lunch)")
}

lunches.forEach { print($0) }

