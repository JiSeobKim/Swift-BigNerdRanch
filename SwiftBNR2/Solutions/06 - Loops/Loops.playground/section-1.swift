// Playground - noun: a place where people can play

import Cocoa

for case let i in 1...100 where i % 3 == 0 {
    print(i)
}

var myFirstInt: Int = 0

for var i = 1; i < 6; ++i {
    ++myFirstInt
    print(myFirstInt)
}

var i = 1
while i < 6 {
    ++myFirstInt
    print(myFirstInt)
    ++i
}

var shields = 5
var blastersOverheating = false
var blasterFireCount = 0
while shields > 0 {
    if blastersOverheating {
        print("Blasters are overheated!  Cooldown initiated.")
        sleep(5)
        print("Blasters ready to fire")
        sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
    }
    if blasterFireCount > 100 {
        blastersOverheating = true
        continue
    }
    // Fire blasters!
    print("Fire blasters!")
    ++blasterFireCount
}
