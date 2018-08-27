//: Chapter 25 - Equatable and Comparable
//: =====================================

/*:
- Conforming to Equatable
- Conforming to Comparable
- Comparable's Inheritance
- 🏅 Bronze Challenge
- 🏅 Gold Challenge
- 🏅 Platinum Challenge

*/

import Cocoa

//: Conforming to Equatable
//: -----------------------

/*
struct Point: Equatable {
    let x: Int
    let y: Int
}

func ==(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)

let abEqual = (a == b)
let abNotEqual = (a != b)
*/

//: Conforming to Comparable
//: ------------------------

/*
struct Point: Equatable, Comparable {
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

let cdEqual = (c == d)
let cLessThanD = (c < d)

let cLessThanEqualD = (c <= d)
let cGreaterThanD = (c > d)
let cGreaterThanEqualD = (c >= d)
*/

//: Comparable's Inheritance
//: ------------------------


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

let cdEqual = (c == d)
let cLessThanD = (c < d)

let cLessThanEqualD = (c <= d)
let cGreaterThanD = (c > d)
let cGreaterThanEqualD = (c >= d)

//: - 🏅 Bronze Challenge
//: ---------------------

func +(lhs:Point, rhs: Point) -> Point {
    return Point(x: (lhs.x + rhs.x), y: (lhs.y + rhs.y))
}

let aPlusb = a + b
//print(aPlusb)

//: - 🏅 Gold Challenge
//: -------------------

/*
class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let p1 = Person(name: "Brigitte", age: 38)
let p2 = Person(name: "Shaun", age: 35)

var people = [Person]()
people.append(p1)
people.append(p2)

let p1Index = people.indexOf{ $0.name == p1.name }
if let p1Index = p1Index {
    print(p1Index)
}
*/

//: - 🏅 Platinum Challenge
//: ------------------------

//func distanceFromOrigin(a: Point, b: Point) -> Double {
//    let x = Double(a.x - b.x)
//    let y = Double(a.y - b.y)
//    let x2 = x * x
//    let y2 = y * y
//    let x2Plusy2 = x2 + y2
//    return sqrt(x2Plusy2)
//}
//
//
//func <(lhs: Point, rhs: Point) -> Bool {
//    
//    let distance = distanceFromOrigin(lhs, b: rhs)
//    print(distance)
//    
//    aDistanceFromOrigin =
//    bDistanceFromOrigin =
//    
//    
////    return (lhs.x < rhs.x) && (lhs.y < rhs.y)
//}
//
//
//let e = Point(x: 3, y: 4)
//let f = Point(x: 2, y: 5)
//
//let eGreaterThanF = (e > f)
//let eLessThanF = (e < f)
//let eEqualToF = (e == f)
//


//: - Custom Operators
//: ------------------


class Person: Equatable {
    var name: String
    weak var spouse: Person?
    
    init(name: String, spouse: Person?) {
        self.name = name
        self.spouse = spouse
    }
    
    func marry(spouse: Person) {
        self.spouse = spouse
        spouse.spouse = self
    }
}

func ==(lhs: Person, rhs: Person) -> Bool {
    return (lhs.name == rhs.name) && (lhs.spouse == rhs.spouse)
}

infix operator +++ {}

func +++(lhs: Person, rhs: Person) {
    lhs.spouse = rhs
    rhs.spouse = lhs
}

let matt = Person(name: "Matt", spouse: nil)
let drew = Person(name: "Drew", spouse: nil)


matt +++ drew

print("Matt's spouse: \(matt.spouse?.name)")
print("Drew's spouse: \(drew.spouse?.name)")

let shaun = Person(name: "Shaun", spouse: nil)
let brigitte = Person(name: "Brigitte", spouse: nil)

shaun.marry(brigitte)
print(shaun.spouse?.name)
print(brigitte.spouse?.name)
