//: Playground - noun: a place where people can play

import Cocoa

// Bronze Challenge

// What is the binary representation of -1 using 8bit unsigned integer
// 11111111
1 + 2 + 4 + 8 + 16 + 32 + 64 - 128
// = -1

// If you look at the same bit pattern and interpreted it as an 8-bit unsiged integer, what would it be?
// 11111111
print("The maximum UInt8 value is \(UInt8.max).")
1 + 2 + 4 + 8 + 16 + 32 + 64 + 128
// = 255

print("The maximum Int value is \(Int.max).")
print("The minimum Int value is \(Int.min).")

print("The maximum Int8 value is \(Int8.max).")
print("The minimum Int8 value is \(Int8.min).")

print("The maximum Int32 value is \(Int32.max)")
print("The minimum Int32 value is \(Int32.min)")

print("The maximum UInt value is \(UInt.max)")
print("The minimum UInt value is \(UInt.min)")

print("The maximum UInt32 value is \(UInt32.max)")
print("The minimum UInt32 value is \(UInt32.min)")


// Creating Integer Instances
let numberOfPages: Int = 0
let numberOfChapters = 3

let numberOfPeople: UInt = 40
let volumeAdjustment: Int32 = -1000

// Operations on Integers
print(10 + 20)
print(30 - 5)
print(5 * 6)
print(10 + 2 * 5)
print(30 - 5 - 5)

print((10 + 2) * 5)
print(30 - (5 - 5))

print(11 / 3)
print(-11 / 3)

print(11 % 3)
print(-11 % 3)

var x = 10

x++ // will be removed in future
x-- // will be removed in future
x += 10

let y: Int8 = 120
let z  = y &+ 10

let a: Int16 = 200
let b: Int8 = 50
let c = a + Int16(b)

let d1 = 1.1 // implicitly double
let d2: Double = 1.1
let f1: Float = 100.3

print(10.0 + 11.4)
print(11.0 / 3.0)
print(12.4 % 5)

if d1 == d2 {
    print("d1 and d2 are the same")
}

print("d1 + 0.1 is \(d1 + 0.1)")

if d1 + 0.1 == 1.2 {
    print("d1 is equal to 1.2")
}




