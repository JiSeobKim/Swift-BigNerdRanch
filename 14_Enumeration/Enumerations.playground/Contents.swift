//: Playground - noun: a place where people can play

import UIKit


enum TextAlignment: Int {
    case left = 20
    case right = 30
    case center = 40
    case justify = 50
}


var alignment: TextAlignment = .left

switch alignment {
case .left:
    print("left aligned")
case .right:
    print("right aligned")
case .center:
    print("center aligned")
case .justify:
    print("justify aligned")
}

if let myAlignment = TextAlignment(rawValue: 20) {
    print(myAlignment)
}

enum ProgrammingLanguage: String {
    case swift
    case objectiveC = "objc"
}

print(ProgrammingLanguage.swift.rawValue)
print(ProgrammingLanguage.objectiveC.rawValue)


enum Lightbulb {
    case on
    case off
    
    func surfaceTemperature(forAmbienTemperature ambient: Double) -> Double {
        switch self {
        case .on:
            return ambient + 150.0
        case .off:
            return ambient
        }
    }
    
    mutating func toggle() {
        self = (self == .on ? .off : .on)
    }
}


var bulb = Lightbulb.on
let ambientTemperature = 77.0

bulb.toggle()
var bulbTemperature = bulb.surfaceTemperature(forAmbienTemperature: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")



enum ShapeDimensions {
    case point
    case square(side: Double)
    case rectangle(width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * side
        case let .rectangle(width: w, height: h):
            return w * h
        }
    }
}

var squareShape = ShapeDimensions.square(side: 10.0)
var rectShape = ShapeDimensions.rectangle(width: 5, height: 10)
var pointShape = ShapeDimensions.point

print("square's area = \(squareShape.area())")
print("rect's area = \(rectShape.area())")
print("point's area = \(pointShape.area())")




enum FamilyTree {
    case noKnownParents
    indirect case oneKnownParent(name: String, ancestors: FamilyTree)
    indirect case twoKnownParents(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}

let fredAncestors = FamilyTree.twoKnownParents(fatherName: "Fred Sr.",
                                               fatherAncestors: .oneKnownParent(name: "Beth", ancestors: .noKnownParents),
                                               motherName: "Marsha", motherAncestors: .noKnownParents)


