//: Playground - noun: a place where people can play

import Cocoa

// Silver Challenge

// H U+0048
// e U+0065
// l U+006C
// o U+006F

let helloFromUnicodeScalars = "\u{0048}\u{0065}\u{006c}\u{006c}\u{006f}"


let playground = "Hello, playground"
var mutablePlayground = "Hello mutable playground"
mutablePlayground += "!"

for c in mutablePlayground.characters {
    print(c)
}

let oneCoolDude = "\u{1F60E}"
let aAcute = "\u{0061}\u{0301}"

for scalar in playground.unicodeScalars {
    print(scalar.value)
}

let aAcutePrecomposed = "\u{00E1}"

let b = aAcute == aAcutePrecomposed

print(aAcute.characters.count)
print(aAcutePrecomposed.characters.count)

let fromStart = playground.startIndex
let toPosition = 4
let end = fromStart.advancedBy(toPosition)
let fifthCharacter = playground[end]
let range = fromStart...end
let firstFive = playground[range]





