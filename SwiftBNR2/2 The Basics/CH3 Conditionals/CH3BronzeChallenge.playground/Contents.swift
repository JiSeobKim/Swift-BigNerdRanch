// Swift Programming: The Big Nerd Ranch
// Chapter 3
// Conditionals
// Bronze Challenge

import Cocoa

var population: Int = 404220
var message: String
var hasPostOffice: Bool = true

if population < 10000 {
    message = "\(population) is a small town"
} else if population >= 10_000 && population < 50_000 {
    message = "\(population) is a medium town"
} else if population >= 50_000 {
    message = "\(population) is very large"
} else {
    message = "\(population) is pretty big"
}

print(message)

if !hasPostOffice {
    print("Where do we get stamps?")
}