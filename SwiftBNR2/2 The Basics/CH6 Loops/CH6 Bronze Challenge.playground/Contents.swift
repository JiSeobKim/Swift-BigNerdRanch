//: Playground - noun: a place where people can play

import Cocoa

// Bronze challenge

for _ in 1...5 {
    for case let i in 1...100 where i % 2 == 0 {
        print(i)
    }
}


var myFirstInt: Int = 0

for _ in 1...5 {
    myFirstInt += 1
    // print("\(myFirstInt) equals \(i)")
    print(myFirstInt)
}


for case let i in 1...100 where i % 3 == 0 {
    print(i)
}

// Classic for loop

myFirstInt = 0
for var i = 1; i < 6; i++ {
    myFirstInt += 1
}

// While loop


var i = 0
myFirstInt = 0

while i > 6 {
    ++myFirstInt
    print(myFirstInt)
    ++i
}


var shields = 5
var blasterIsOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0

while shields > 0 {
    
    if spaceDemonsDestroyed == 500 {
        print("You beat the game!")
        break
    }
    
    if blasterIsOverheating {
        print("Blasters are overheated. Cooldown initiated")
        sleep(5)
        print("Blasters ready to fire")
        sleep(1)
        blasterIsOverheating = false
        blasterFireCount = 0
    }
    
    if blasterFireCount > 100 {
        blasterIsOverheating = true
        continue
    }
    
    print("Fire blasters")
    blasterFireCount++
    spaceDemonsDestroyed++
}






