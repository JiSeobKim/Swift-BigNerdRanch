// MARK: Typealias for Double
typealias Velocity = Double

// MARK: Extend Velocity to suport converting
// Velocity is a typealias on Double that presents some complications with the visibility of the alias project-wide
// I.e., there is a problem with the interchangeability of Velocity for Double
extension Velocity {
    var kph: Velocity { return self * 1.60934 }
    var mph: Velocity { return self }
}

// MARK: VehicleType
protocol VehicleType {
    var topSpeed: Velocity { get }
    var numberOfDoors: Int { get }
    var hasFlatbed: Bool { get }
}

// MARK: Car struct
struct Car {
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickname: String
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0, "New value must be between 0 and 1.")
        }
    }
}

// MARK: Conforming to VehicleType
extension Car: VehicleType {
    var topSpeed: Velocity { return 180 }
    var numberOfDoors: Int { return 4 }
    var hasFlatbed: Bool { return false }
}

// MARK: Extend Car to have convenience initializer
// Define initializer in an extension to retain free memberwise initializer
extension Car {
    init(carMake: String, carModel: String, carYear: Int) {
        self.init(make: carMake,
            model: carModel,
            year: carYear,
            color: "Black",
            nickname: "N/A",
            gasLevel: 1.0)
    }
}

// MARK: Create a Car instance
var c = Car(carMake: "Ford", carModel: "Fusion", carYear: 2013)

// MARK: Nested type
extension Car {
    enum CarKind: CustomStringConvertible {
        case Coupe, Sedan
        
        var description: String {
            switch self {
            case .Coupe:
                return "Coupe"
                
            case .Sedan:
                return "Sedan"
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

c.kind.description

// MARK: Gas functions
extension Car {
    mutating func emptyGas(amount: Double) {
        precondition(amount <= 1 && amount > 0, "Amount to remove must be between 0 and 1.")
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
