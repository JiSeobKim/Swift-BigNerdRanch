//: Chapter 12 - Functions
//: ======================

import Cocoa

//: 🏅 Bronze Challenge

func bronzeGreetByMiddleName(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle
        where middleName.characters.count < 4 else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}

bronzeGreetByMiddleName(("Matt", "Dan", "Mathias"))

//: 🏅 Silver Challenge


func beanSifter(groceryList list: [String]) -> (beans: [String], otherGroceries:[String]) {
    
    var beanList = [String]()
    var otherList = [String]()

    for item in list {
    
        //if item.containsString("beans") {
        if item.hasSuffix("beans") {
            beanList.append(item)
        } else {
            otherList.append(item)
        }
    }
    
    return (beanList, otherList)
}

let myGroceryList = [
    "green beans",
    "milk",
    "black beans",
    "pinto beans",
    "apples"
]

let result = beanSifter(groceryList: myGroceryList)
result.beans
result.otherGroceries

//: A Basic Function
//: ----------------


//: Defining a function

func printGreeting() {
    print("Hello, playground")
}

printGreeting()

//: Function Parameters
//: -------------------

func printPersonalGreeting(name: String) {
    print("Hello \(name), welcome to playground")
}

printPersonalGreeting("Matt")

func divisionDescription(forNumerator num: Double, andDenominator den: Double) {
    print("\(num) divided by \(den) equals \(num / den)")
}

divisionDescription(forNumerator: 9, andDenominator: 3)

//: Variadic paramaters

func printPersonalGreetings(names: String...) {
    for name in names {
        print("Hello \(name), welcome to playground")
    }
}

printPersonalGreetings("Alex", "Chris", "Drew", "Pat")

//: Default parameter values

func alsoDivisionDescription(forNumerator num: Double,
    andDenominator den: Double,
    withPunctuation punctuation: String = ". ") {
        print("\(num) divided by \(den) equals \(num / den)\(punctuation)")
}

alsoDivisionDescription(forNumerator: 9, andDenominator: 3)
alsoDivisionDescription(forNumerator: 9, andDenominator: 3, withPunctuation: "!")

//: In-out parameters

var error = "The request failed:"

func appendErrorCode(code: Int, inout toErrorString errorString: String) {
    if code == 400 {
        errorString += " bad request."
    }
}

appendErrorCode(400, toErrorString: &error)
print(error)

//: Returning from a Function

func anotherDivisionDescription(forNumerator num: Double,
    andDenominator den: Double,
    withPunctuation punctuation: String = ".") -> String {
        return "\(num) divided by \(den) equals \(num / den)\(punctuation)"
}

print(anotherDivisionDescription(forNumerator: 9.0, andDenominator: 3.0, withPunctuation: "!"))

//: Nested Functions and Scope

func areaOfTriangle(withBase base: Double, andHeight height: Double) -> Double {
    let numerator = base * height
    
    func divide() -> Double {
        return numerator / 2
    }
    
    return divide()
}

areaOfTriangle(withBase: 3.0, andHeight: 5.0)

//: Multiple Returns

func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}

let aBunchOfNumbers = [10,1,4,3,57,43,84,27,156,111]
let theSortedNumbers = sortEvenOdd(aBunchOfNumbers)
theSortedNumbers.evens
theSortedNumbers.odds

//: Optional Return Types

func grabMiddleName(name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(("Matt", "Pat", "Mathias"))
if let theName = middleName {
    print(theName)
}

//: Exiting Early from a Function

func greetByMiddleName(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}

greetByMiddleName(("Matt", "Danger", "Mathias"))

//: Function Types

let evenOddFunction: ([Int] -> ([Int] , [Int])) = sortEvenOdd

evenOddFunction([1,2,3])
