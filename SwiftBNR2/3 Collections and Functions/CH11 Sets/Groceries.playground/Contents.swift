//: Chapter 11 - Sets
//: =================

import Cocoa

//: 🏅 Bronze Challenge

let myCities = Set(["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco"])
let yourCities = Set(["Chicago", "San Francisco", "Jacksonville"])

let myCitiesContainsAllYourCities = myCities.isSupersetOf(yourCities)

//: 🏅 Silver Challenge

var myGroceryBag: Set = ["Apples", "Oranges", "Pineapples"]

let otherFriendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])

let otherRoommatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])

myGroceryBag.unionInPlace(otherFriendsGroceryBag)
myGroceryBag.intersectInPlace(otherRoommatesGroceryBag)

//: Getting a set
//: -------------

//: Creating a set

/*
var groceryBag = Set<String>()

//: Adding to a set

groceryBag.insert("Apples")
groceryBag.insert("Oranges")
groceryBag.insert("Pineapples")

//: Looping through a set

for food in groceryBag {
    print(food)
}

*/

//: Creating a set, redux

// var groceryBag = Set(["apples", "Oranges", "Pineapples"])

var groceryBag: Set = ["Apples", "Oranges", "Pineapples"]

//: Working with Sets
//: -----------------

//: Has bananas?

let hasBananas = groceryBag.contains("Bananas")

//: Unions

let friendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])

let commonGroceryBag = groceryBag.union(friendsGroceryBag)

//: Intersects

let roommatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersect(roommatesGroceryBag)

//: Disjoint

let yourSecondbag = Set(["Berries", "Yogurt"])
let roommatesSecondbag = Set(["Grapes", "Honey"])
let disjoint = yourSecondbag.isDisjointWith(roommatesSecondbag)
