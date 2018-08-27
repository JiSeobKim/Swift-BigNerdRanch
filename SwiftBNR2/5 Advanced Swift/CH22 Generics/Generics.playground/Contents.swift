//: Chapter 21 - Extensions
//: =======================

/*:
- Generic Data Structures
- Generic Functions and Methods
- Type Constraints
- Associated Type Protocols
- Type Constraint where Clauses
- 🏅 Bronze Challenge
- 🏅 Silver Challenge
- 🏅 Gold Challenge
- For the More Curious: Understanding Optionals
- For the More Curious: Parametric Polymorphism
*/

import Cocoa


//: Generic Data Structures
//: -----------------------

/*
struct Stack {
var items = [Int]()

mutating func push(newItem: Int) {
items.append(newItem)
}

mutating func pop() -> Int? {
guard !items.isEmpty else {
return nil
}
return items.removeLast()
}
}

var intStack = Stack()
intStack.push(1)
intStack.push(2)

print(intStack.pop())
print(intStack.pop())
print(intStack.pop())
*/

//: Making Stack generic

/*
struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
}

//: Specializing intStack

var intStack = Stack<Int>()

var stringStack = Stack<String>()
stringStack.push("this is a string")
stringStack.push("another string")

print(stringStack.pop())

*/

//: Generic Functions and Methods
//: -----------------------------


func myMap<T, U>(items: [T], f:(T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one", "two", "three"]

func numberOfCharactersInString (input: String) -> Int {
    return input.characters.count
}

print(myMap(strings, f: numberOfCharactersInString))

print(myMap(strings) { $0.characters.count })


//: Mapping on Stack
/*
struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func map<U>(f: Element -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
}

//: Specializing intStack

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
var doubledStack = intStack.map({ 2 * $0 })
print(doubledStack)

var stringStack = Stack<String>()
stringStack.push("this is a string")
stringStack.push("another string")

print(stringStack.pop())
print(doubledStack.pop())
print(doubledStack.pop())
print("")
*/
//: Type Constraints
//: ----------------

func checkIfEqual<T: Equatable>(first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual(1, 1))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual("a string", "a different string"))
print("")

func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible> (first: T, _ second: U) -> Bool {
    print("\(first.description) \(second.description)")
    return first.description == second.description
}

print(checkIfDescriptionsMatch(Int(1), UInt(1)))
print(checkIfDescriptionsMatch(1, 1.0))
print(checkIfDescriptionsMatch(Float(1.0), Double(1.0)))

//: Associated Type Protocols
//: -------------------------

/*
struct StackGenerator<T>: GeneratorType {
    typealias Element = T
    
    var stack: Stack<T>
    
    mutating func next() -> Element? {
        return stack.pop()
    }
    
}
*/

// less verbose

struct StackGenerator<T>: GeneratorType {
    var stack: Stack<T>
    mutating func next() -> T? {
        return stack.pop()
    }
}

struct Stack<Element>: SequenceType {
    var items = [Element]()
    
    mutating func push(newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func map<U>(f: Element -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }

    func generate() -> StackGenerator<Element> {
        return StackGenerator(stack: self)
    }
}

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)
print("")
var myStackGenerator = StackGenerator(stack: myStack)

while let value = myStackGenerator.next() {
    print("got \(value)")
}

for value in myStack {
    print("for-in loop: got \(value)")
}

print("")

//: Type Constraint where Clauses
//: -----------------------------

/*
func pushItemsOntoStack<Element>(inout stack: Stack<Element>, fromArray array: [Element]) {
    for item in array {
        stack.push(item)
    }
}


*/

func pushItemsOntoStack<Element, S: SequenceType where S.Generator.Element == Element>(inout stack: Stack<Element>, fromSequence sequence: S) {
    for item in sequence {
        stack.push(item)
    }
}

var myOtherStack = Stack<Int>()
pushItemsOntoStack(&myOtherStack, fromSequence: [1,2,3])
pushItemsOntoStack(&myStack, fromSequence: myOtherStack)

for value in myStack {
    print("after pushing items onto stack. Got \(value)")
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("6")
stackOfStrings.push("5")
stackOfStrings.push("4")

var myStackOfStrings = Stack<String>()
pushItemsOntoStack(&myStackOfStrings, fromSequence: ["1","2","3"])
pushItemsOntoStack(&stackOfStrings, fromSequence: myStackOfStrings)
print(stackOfStrings)







