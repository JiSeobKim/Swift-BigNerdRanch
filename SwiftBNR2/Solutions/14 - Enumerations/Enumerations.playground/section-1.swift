// Playground - noun: a place where people can play

enum TextAlignment : Int {
    case Left    = 20
    case Right   = 30
    case Center  = 40
    case Justify = 50
}

var alignment = TextAlignment.Justify

print("Left has raw value \(TextAlignment.Left.rawValue)")
print("Right has raw value \(TextAlignment.Right.rawValue)")
print("Center has raw value \(TextAlignment.Center.rawValue)")
print("Justify has raw value \(TextAlignment.Justify.rawValue)")
print("alignment has raw value \(alignment.rawValue)")

// Create a raw value
let myRawValue = 100

// Try to convert the raw value into a TextAlignment
if let myAlignment = TextAlignment(rawValue: myRawValue) {
    // Conversion succeeded!
    print("successfully convered \(myRawValue) into a TextAlignment")
} else {
    // Conversion failed
    print("\(myRawValue) has no corresponding TextAlignment case")
}

switch alignment {
case .Left:
    print("left aligned")

case .Right:
    print("right aligned")

case .Center:
    print("center aligned")

case .Justify:
    print("justified")
}

// ---------------------------------------------------------------------------

enum ProgrammingLanguage : String {
    case Swift
    case ObjectiveC = "Objective-C"
    case C
    case Cpp        = "C++"
    case Java
}

let myFavoriteLanguage = ProgrammingLanguage.Swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")

// ---------------------------------------------------------------------------

enum LightBulb {
    case On
    case Off

    func surfaceTemperatureForAmbientTemperature(ambient: Double) -> Double {
        switch self {
        case .On:
            return ambient + 150.0

        case .Off:
            return ambient
        }
    }

    mutating func toggle() {
        switch self {
        case .On:
            self = .Off

        case .Off:
            self = .On
        }
    }
}

var bulb = LightBulb.On
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")

bulb.toggle()
bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")

// ---------------------------------------------------------------------------

enum ShapeDimensions {
    // Point has no associated value - it is dimensionless
    case Point

    // Square's associated value is the length of one side
    case Square(Double)

    // Rectangle's associated value defines its width and height
    case Rectangle(width: Double, height: Double)

    func area() -> Double {
        switch self {
        case .Point:
            return 0

        case let .Square(side):
            print("hi")
            return side * side

        case let .Rectangle(width: w, height: h):
            return w * h
        }
    }
}

var squareShape = ShapeDimensions.Square(10.0)
var rectShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.Point

print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectShape.area())")
print("point's area = \(pointShape.area())")

enum FamilyTree {
    case NoKnownParents
    indirect case OneKnownParent(name: String, ancestors: FamilyTree)
    indirect case TwoKnownParents(fatherName: String, fatherAncestors: FamilyTree,
        motherName: String, motherAncestors: FamilyTree)
}

let fredAncestors = FamilyTree.TwoKnownParents(
    fatherName: "Fred Sr.",
    fatherAncestors: .OneKnownParent(name: "Matilta",
        ancestors: .NoKnownParents),
    motherName: "Marsha",
    motherAncestors: .NoKnownParents)
