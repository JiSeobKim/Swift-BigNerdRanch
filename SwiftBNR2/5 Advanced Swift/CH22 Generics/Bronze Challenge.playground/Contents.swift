//: Chapter 21 - Extensions
//: =======================

/*:
- 🏅 Bronze Challenge
*/

import Cocoa

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
    
    func filter(includeElement: Element -> Bool) -> Stack<Element> {
        var result = [Element]()
        for item in items where includeElement(item) {
            result.append(item)
        }
        return Stack<Element>(items: result)
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
print("")

let testFilter = myStack.filter{ $0 <= 3 }
print(testFilter)






