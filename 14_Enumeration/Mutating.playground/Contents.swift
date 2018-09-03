import UIKit

func greet(name: String, withGreeting greeting: String) -> String {
    return "\(greeting) \(name)"
}


let personalGreeting = greet(name: "Matt", withGreeting: "Hello")
print(personalGreeting)



func greeting(forName name: String) -> (String) -> String {
    func greeting(_ greeting: String) -> String {
        return "\(greeting) \(name)"
    }
    return greeting(_:)
}

let a = greeting(forName: "JS")

let greetMattwWith = greeting(forName: "Matt")
let mattGreeting = greetMattwWith("Awesome")
print(mattGreeting)


func greting(forName name: String) -> (String) -> String {
    return { (_ greet: String) -> String in
        return "\(greet) \(name)"
    }
}

let ax = greting(forName: "KKKK")
let bx = ax("Conceal")
print(bx)


struct Person {
    var firstNm = "Matt"
    var lastNm = "Mathias"
    
    mutating func changeTo(firstNm: String, lastNm: String) {
        self.firstNm = firstNm
        self.lastNm = lastNm
    }
}


var p = Person()
var changeName = Person.changeTo
