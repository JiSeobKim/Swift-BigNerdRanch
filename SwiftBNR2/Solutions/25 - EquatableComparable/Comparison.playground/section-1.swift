// Playground - noun: a place where people can play

import Cocoa
import Swift

struct Point: Comparable {
    let x: Int
    let y: Int
}

func ==(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
}

func <(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x < rhs.x) && (lhs.y < rhs.y)
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)

let abEqual = (a == b)
let abNotEqual = (a != b)

let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)

let cdEqual = (c == b)
let cLessThanD = (c < d)

let cLessThanEqualD = (c <= d)
let cGreaterThanD = (c > d)
let cGreaterThanEqualD = (c >= d)

// Bronze Challenge
func +(lhs: Point, rhs: Point) -> Point {
    let newX = (lhs.x + rhs.x)
    let newY = (lhs.y + rhs.y)
    return Point(x: newX, y: newY)
}

// Gold Challenge
class Person: Equatable {
    var name: String
    var age: Int
    weak var spouse: Person?
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func marry(spouse: Person) {
        self.spouse = spouse
        spouse.spouse = self
    }
}

func ==(lhs: Person, rhs: Person) -> Bool {
    return (lhs.name == rhs.name) && (lhs.age == rhs.age)
}

let p1 = Person(name: "Matt", age: 32)
let p2 = Person(name: "John", age: 31)

let people = [p1, p2]

let p1Index = people.indexOf(p1)

// For the More Curious
let matt = Person(name: "Matt", age: 32)
let drew = Person(name: "Drew", age: 33)

//infix operator +++ {}
//
//func +++(lhs: Person, rhs: Person) {
//    lhs.spouse = rhs
//    rhs.spouse = lhs
//}
//
//matt +++ drew
matt.marry(drew)
matt.spouse?.name
drew.spouse?.name


