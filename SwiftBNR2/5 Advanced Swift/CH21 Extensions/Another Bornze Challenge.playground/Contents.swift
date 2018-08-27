//: Chapter 21 - Extensions
//: =======================

/*:
- 🏅 Another Bronze Challenge
*/

import Cocoa

//: Extending an Existing Type
//: --------------------------

typealias Velocity = Double

extension Velocity {
    var kph: Velocity { return self * 1.60934 }
    var mph: Velocity { return self }
}

protocol VehicleType {
    var topSpeed: Velocity { get }
    var numberOfDoors: Int { get }
    var hasFaltbed: Bool { get }
}

//: Extending your own type
//: -----------------------

struct Car {
    let make: String
    let model: String
    let year: Int
    let numberOfDoors: Int
    let color: String
    let nickname: String
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1.")
        }
    }
}

//: Use extensions to add protocol conformance

extension Car : VehicleType {
    var topSpeed: Velocity { return 180 }
    var hasFaltbed: Bool { return false }
}

//:  Adding an initializer with an extension

extension Car {
    init(carMake: String, carModel: String, carYear: Int, doors: Int) {
        self.init(make: carMake,
            model: carModel,
            year: carYear,
            numberOfDoors: doors,
            color: "Black",
            nickname: "N/A",
            gasLevel: 1.0)
    }
}

var c = Car(carMake: "Tesla", carModel: "Model M", carYear: 2016, doors: 2)
print(c)

//:  Nested types and extensions

extension Car {
    enum CarKind: CustomStringConvertible {
        case Coupe, Sedan
        var description: String {
            switch self {
            case .Coupe: return "Coupe"
            case .Sedan: return "Sedan"
            }
        }
    }
    
    var kind: CarKind {
        if numberOfDoors == 2 {
            return .Coupe
        } else {
            return .Sedan
        }
    }
}

print(c.kind.description)

//: Extensions with functions

extension Car {
    mutating func emptyGas(amount: Double) {
        precondition(amount <= 1 && amount > 0, "Amount to remove must be between 0 and 1.0")
        gasLevel -= amount
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}

c.emptyGas(0.3)
c.gasLevel
c.fillGas()
c.gasLevel
