//: Chapter 18 - Value vs. Reference Types
//: ======================================

/*:
- Value Semantics
- Reference Semantics
- Constant Value and Reference Types
- Using Value and Reference Types Together
    - Immutable reference types
- Copying
- Identity vs. Equality
- What should I use
*/

import Cocoa

//: 🏅 Silver Challenge


//: Value Semantics
//: ---------------


var str = "Hello, playground"
var playgroundGreeting = str
playgroundGreeting += "! How are you today?"


//: Reference Semantics
//: -------------------

class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let hecate = GreekGod(name: "Hecate")
let anotherHecate = hecate
anotherHecate.name = "AnotherHecate"

// same instance
anotherHecate.name
hecate.name

//: Constant Value and Reference Types
//: ----------------------------------

struct Pantheon {
    let chiefGod: GreekGod
    let dateCreated = NSDate()
}

let pantheon = Pantheon(chiefGod: hecate)
let zeus = GreekGod(name: "Zeus")

// pantheon.chiefGod = zeus // not possible

zeus.name = "Zeus Jr."
zeus.name

//: Using Value and Reference Types Together
//: ----------------------------------------

pantheon.chiefGod.name
let greekPantheon = pantheon
hecate.name = "Trivia"
greekPantheon.chiefGod.name

// Don't put a reference type (class) within a value type (struct)

//: Immutable reference types

greekPantheon.dateCreated

//: Copying
//: -------

// Copies in Swift are shallow

let athena = GreekGod(name: "Athena")
let gods = [athena, hecate, zeus]

//: Shallow copy of an array

let godsCopy = gods
gods.last?.name = "Jupiter"
gods
godsCopy

//: Identity vs. Equality
//: ---------------------

let x = 1
let y = 1
x == y

athena === hecate



