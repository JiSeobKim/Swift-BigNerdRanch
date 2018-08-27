//: Chapter 14 - Enumerations
//: =========================

import Cocoa

//: 🏅 Bronze Challenge

enum ShapeDimensionsBronze {
    case Point // has no associated values
    case Square(Double)
    case Rectangle(width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case let .Square(side):
            return side * side
        case let .Rectangle(width: w, height: h):
            return w * h
        case .Point: return 0
        }
    }
    
    func perimeter() -> Double {
        switch self {
        case .Point: return 0
        case let .Square(side):
            return side * 4
        case let .Rectangle(width: w, height: h):
            return (w * 2) + (h * 2)
        }
    }
}


let mySquare = ShapeDimensionsBronze.Square(2.0)
let myRectangle = ShapeDimensionsBronze.Rectangle(width: 2.0, height: 4.0)


mySquare.perimeter()
myRectangle.perimeter()

//: 🏅 Silver Challenge

enum ShapeDimensionsSilver {
    case Point // has no associated values
    case Square(Double)
    case Rectangle(width: Double, height: Double)
    case RightTriangle(adjacent: Double, oposite: Double)
    
    func area() -> Double {
        switch self {
        case let .Square(side):
            return side * side
        case let .Rectangle(width: w, height: h):
            return w * h
        case .Point: return 0
        case let .RightTriangle(adjacent: a, oposite: o):
            return 0.5 * a * o
        }
    }
}

let mySilverTriangle = ShapeDimensionsSilver.RightTriangle(adjacent: 2.0, oposite: 3.0)
mySilverTriangle.area()


//: Basic Enumerations
//: ------------------

enum TextAlignment {
    case Left
    case Right
    case Center
    case Justify
}

//: Creating an instance of TextAlignment

var alignment: TextAlignment = TextAlignment.Left

//: Taking advantage of type inference

var implicitAlignment = TextAlignment.Left

//: Inferring the enum type

alignment = .Right

//: Type inference when comparing values

//if alignment == .Right {
//    print("We should right-align the text!")
//}

switch alignment {
case .Left: print("Left Aligned")
case .Right: print("Right Aligned")
case .Center: print("Center Aligned")
case .Justify: print("Justified")
}

//: Making center the default case

//switch alignment {
//case .Left: print("Left")
//case .Right: print("Right")
//default: print("Center")
//}

//: Raw Value Enumerations
//: ----------------------

enum TextAlignmentRawValue: Int {
    case Left
    case Right
    case Center
    case Justify
}

var alignmentRawValue = TextAlignmentRawValue.Justify

//: Confirming the raw values

print("Left has raw value \(TextAlignmentRawValue.Left.rawValue)")
print("Right has raw value \(TextAlignmentRawValue.Right.rawValue)")
print("Center has raw value \(TextAlignmentRawValue.Center.rawValue)")
print("Justify has raw value \(TextAlignmentRawValue.Justify.rawValue)")
print("The alignment variable has raw value \(alignmentRawValue)")

//: Specifying raw values

enum TextAlignmentSpecifyRawValues: Int {
    case Left = 20
    case Right = 30
    case Center = 40
    case Justify = 50
}

//: Converting raw values to enum types

// Create a raw value
let myRawValue = 30

// Try to convert the raw value into a TextAlignment

if let myAlignment = TextAlignmentSpecifyRawValues(rawValue: myRawValue) {
    // Conversion succeeded
    print("Sucessfully converted \(myRawValue) into a TextAlignment")
} else {
    // Conversion failed
    print("\(myRawValue) has no corresponding TextAlignment case")
}

// Creating an enum with strings

enum ProgrammingLanguage: String {
    case Swift
    case ObjectiveC = "Objective-C"
    case C
    case Cpp = "C++"
    case Java
}

let myFavouriteLanguage = ProgrammingLanguage.Swift
myFavouriteLanguage.rawValue

//: Method
//: ------

enum LightBulb {
    case On
    case Off
    
    func surfaceTemperatureForAmbientTemperature(ambient: Double) -> Double {
        switch self {
        case .On: return ambient + 150.0
        case .Off: return ambient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .On: self = .Off
        case .Off: self = .On
        }
    }
}

var bulb = LightBulb.On

let ambientTemperature = 77.0
var bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)

bulb.toggle()

bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)

//: Associated Values
//: -----------------

enum ShapeDimensions {
    case Point // has no associated values
    case Square(Double)
    case Rectangle(width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case let .Square(side):
            return side * side
        case let .Rectangle(width: w, height: h):
            return w * h
        case .Point: return 0
        }
    }
}

var squareShape = ShapeDimensions.Square(10.0)
var rectShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.Point

squareShape.area()
rectShape.area()
pointShape.area()

//: Recursive Enumerations
//: ----------------------

// indirect:  instruct the compiler to instead store the enum's data behind a pointer.
/*
indirect enum FamilyTree {
    case NoKnownParents
    case OneKnownParent(name: String, ancestors: FamilyTree)
    case TwoKnownParents(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors:FamilyTree)
}
*/ // or

enum FamilyTree {
    case NoKnownParents
    indirect case OneKnownParent(name: String, ancestors: FamilyTree)
    indirect case TwoKnownParents(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors:FamilyTree)
}

let fredAncestors = FamilyTree.TwoKnownParents(fatherName: "Fred Sr.", fatherAncestors: .OneKnownParent(name: "Beth", ancestors: .NoKnownParents ), motherName: "Marsha", motherAncestors: .NoKnownParents)




