import UIKit


var str = "Hello, playground"

var playgroundGreeting = str


func printValue() {
    print(str)
    print(playgroundGreeting)
}


printValue()

playgroundGreeting += "! How are you today?"

printValue()

print("Awesome")



let test = "김밥 3천원, 우동 500원"

let firstItem = test.firstIndex(of: ",") ?? test.endIndex

print(test[..<firstItem])



class GreekGod {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


let hecate = GreekGod(name: "Hecate'")

let anotherHecate = hecate


hecate.name
anotherHecate.name

anotherHecate.name = "AnotherHecate"

hecate.name
anotherHecate.name


struct Pantheon {
    var chiefGod: GreekGod
}

let pantheon = Pantheon(chiefGod: hecate)
let zeus = GreekGod(name: "Zeus")

zeus.name = "Zeus Jr."
zeus.name

pantheon.chiefGod.name
let greekPantheon = pantheon
hecate.name = "Trivia"
greekPantheon.chiefGod.name
