//: Chapter 21 - Extensions
//: =======================


// INCOMPLETE

/*:
- 🏅 Gold Challenge
*/

import Cocoa

// lx should be generic CollectionType
// return an array of an associated type of the CollectionType protocol

func findAll<T: Equatable>(lx: [T], indexesOf: T) -> [Int]? {
    var result = [Int]()
    for (index, x) in lx.enumerate() where x == indexesOf {
        result.append(index)
    }
    return result
}

findAll([5,3,7,3,9], indexesOf: 3)
findAll(["5","3","7","3","9"], indexesOf: "3")


findAll(["one","two", "three"], indexesOf: "two")