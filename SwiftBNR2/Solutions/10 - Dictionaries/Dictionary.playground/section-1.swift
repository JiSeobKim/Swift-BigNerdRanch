// Playground - noun: a place where people can play

import Cocoa

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]
print("I have rated \(movieRatings.count) movies.")
let darkoRating = movieRatings["Donnie Darko"]
movieRatings["Dark City"] = 5
movieRatings
let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, currentRating = movieRatings["Donnie Darko"] {
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}
movieRatings["The Cabinet of Dr. Caligari"] = 5
//let removedRating: Int? = movieRatings.removeValueForKey("Dark City")
movieRatings["Dark City"] = nil

for (key, value) in movieRatings {
    print("The movie \(key) was rated: \(value).")
}

for movie in movieRatings.keys {
    print("User has rated \(movie).")
}

let watchedMovies = Array(movieRatings.keys)

// Challenge
let georgia = ["Cobb": [30301,30302,30303,30304,30305],
               "Dekalb": [30306,30307,30308,30309,30310],
               "Fulton": [30311,30312,30313,30314,30315]
               ]
var zipcodes: [Int] = []
for zipcodeArray in georgia.values {
    for zipcode in zipcodeArray {
        zipcodes.append(zipcode)
    }
}
print("Georgia has the following zip codes: \(zipcodes)")

movieRatings["hey"]
