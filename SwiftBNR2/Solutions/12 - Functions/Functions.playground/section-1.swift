// Playground - noun: a place where people can play

import Cocoa

func printPersonalGreetings(names: String...) {
    for name in names {
        print("Hello \(name), welcome to the playground.")
    }
}
printPersonalGreetings("Alex","Chris","Drew","Pat")

func divisionDescription(forNumerator num: Double, andDenominator den: Double, punctuation: String = ".") -> String {
    return "\(num) divided by \(den) equals \(num / den)\(punctuation)"
}
print(divisionDescription(forNumerator: 9, andDenominator: 3))
print(divisionDescription(forNumerator: 9, andDenominator: 3, punctuation: "!"))

var error = "The request failed:"
func appendErrorCode(code: Int, inout toErrorString errorString: String) {
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &error)
error

func areaOfTriangle(withBase base: Double, andHeight height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}
areaOfTriangle(withBase: 3.0, andHeight: 5.0)

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
print("The even numbers are: \(theSortedNumbers.evens); the odd numbers are: \(theSortedNumbers.odds)")

func grabMiddleName(name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(("Matt",nil,"Mathias"))
if let theName = middleName {
    print(theName)
}

func greetByMiddleName(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)!")
}

greetByMiddleName(("Matt","Danger","Mathias"))

let evenOddFunctionType: ([Int]) -> ([Int], [Int]) = sortEvenOdd

// Bronze Challenge

func shortGreeting(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle where middleName.characters.count < 4 else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)!")
}

shortGreeting(("Sarah", "Pam", "Johnson"))

// Silver Challenge

let groceries = ["banana","apple","red beans","black beans"]
func beanCounter(groceryList groceryList: [String]) -> (beanCount: Int, beansBought: [String]) {
    var beanCount = 0
    var beansBought = [String]()
    for item in groceryList {
        if item.hasSuffix("beans") {
            ++beanCount
            beansBought.append(item)
        }
    }
    return (beanCount, beansBought)
}
let beansInfo = beanCounter(groceryList: groceries)
beansInfo.beanCount
beansInfo.beansBought
