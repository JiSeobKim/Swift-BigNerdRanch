//: Chapter 10 - Dictionaries
//: =========================

import Cocoa

//: 🏅 Silver Challenge

let state = [
    "United States" : [11111, 22222, 33333, 44444, 55555],
    "South Africa" : [66661, 66662, 66663, 66664, 66665],
    "United Kingdom" : [88881, 88882, 88883, 88884, 88885]
]

var allCodes = [Int]()

for zips in state.values {
    allCodes += Array(zips)
}

print(allCodes)


//: Creating a dictionary

var movieRatings = [
    "Donnie Darko" : 4,
    "Chungking Express" : 5,
    "Dark City" : 4
]

//: Accessing and Modifying a Dictionary
//: -------------------------------------

//: Using Count

print("I have rated \(movieRatings.count) movies.")

//: Reading a value from the dictionary

let darkoRating = movieRatings["Donnie Darko"]

//: Modifing a value

movieRatings["Dark City"] = 5
// print(movieRatings)

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")

if let lastRating = oldRating,
    currentRating = movieRatings["Donnie Darko"] {
        print("Old rating \(lastRating); current rating: \(currentRating)")
}

//: Adding and Removing Values
//: --------------------------

//: Adding a value

movieRatings["The Cabinet of Dr. Caligari"] = 5

//: Removing a value

// let removedValue = movieRatings.removeValueForKey("Dark City")

movieRatings["Dark City"] = nil

// print(movieRatings)


//: Looping
//: -------

//: Looping through your dictionary

for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value)")
}

//: Just the keys

print("")

for movie in movieRatings.keys {
    print("User has rated \(movie)")
}

//: Immutable Dictionaries
//: ----------------------

//: Creating an immutable dictionary

let album = [
    "Diet Roast Beef" : 268,
    "Dubba Dubbs Stubs His Toe" : 467,
    "Smoky's Carpet Cleaning Service" : 187,
    "Track 4" : 22
]

//: Translating a Dictionary to an Array
//: ------------------------------------

//: Sending keys to an array

let watchedMovies = Array(movieRatings.keys)


