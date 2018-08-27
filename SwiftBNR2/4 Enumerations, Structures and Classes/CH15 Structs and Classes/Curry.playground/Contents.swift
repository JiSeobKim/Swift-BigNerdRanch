//: Chapter 15 - Curried Functions
//: ==============================

import Cocoa

//: 🏅 Bronze Challenge


func greetName(name: String, withGreeting greeting: String) -> String {
    return "\(greeting) \(name)"
}

let personalGreeting = greetName("Matt", withGreeting: "Hello")

//: Curried Version
//: ---------------


func curriedGreetingForName(name: String) -> (String) -> String {

    func greeting(greeting: String) -> String {
        return "\(greeting) \(name)"
    }
    
    return greeting
}

let greeterFunction = curriedGreetingForName("Matt")
let theGreeting = greeterFunction("Hello")

// A more concise curried function

func conciseGreeting(greeting: String)(name: String) -> String {
    return "\(greeting) \(name)"
}

let friendlyGreeting = conciseGreeting("Hello, ")
let newGreeting = friendlyGreeting(name: "Matt")

struct Person {
    var firstName = "Matt"
    var lastName = "Mathias"
    
    mutating func changeName(fn: String, ln: String) {
        firstName = fn
        lastName = ln
    }
}

var p = Person()

// Instance methods are curried functions

let changer = Person.changeName
changer(&p)("John", ln: "Gallagher")
p.firstName
p.lastName


p.changeName("Matt", ln: "Matthias")
p.firstName
p.lastName