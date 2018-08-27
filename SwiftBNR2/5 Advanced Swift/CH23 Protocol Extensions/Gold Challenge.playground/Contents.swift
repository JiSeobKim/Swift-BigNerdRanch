//: Chapter 23 - Protocol Extension
//: ===============================

/*:
- 🏅 Gold Challenge
*/

import Cocoa

protocol ExerciseType: CustomStringConvertible {
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
    var title: String { get }
}

extension ExerciseType {
    var description: String {
        return "Exercise \(name), burned \(caloriesBurned) calories in \(minutes) minutes"
    }
}

extension ExerciseType {
    var title: String {
        return"\(name) - \(minutes) minutes"
    }
}

struct EllipticalTrainer: ExerciseType {
    let name = "Elliptical Machine"
    let title = "Go Fast Elliptical Machine 3000"
    let caloriesBurned: Double
    let minutes: Double
}

struct Treadmill: ExerciseType {
    let name = "Treadmill"
    let caloriesBurned: Double
    let minutes: Double
    let distanceInMiles: Double
}

extension Treadmill {
    var description: String {
        return "Treadmill(\(caloriesBurned) calories and \(distanceInMiles) miles in \(minutes) minutes)"
    }
}

struct RowMachine: ExerciseType {
    let name = "Row Machine"
    let caloriesBurned: Double
    let minutes: Double
    let distanceInMiles: Double
}


let ellipticalWorkout = EllipticalTrainer(caloriesBurned: 335, minutes: 30)
let runningWorkout = Treadmill(caloriesBurned: 350, minutes: 25, distanceInMiles: 4.2)
let rowingWorkout = RowMachine(caloriesBurned: 100, minutes: 10, distanceInMiles: 3.0)

extension ExerciseType {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}

//print(ellipticalWorkout.caloriesBurnedPerMinute)
//print(runningWorkout.caloriesBurnedPerMinute)


extension SequenceType where Generator.Element == ExerciseType {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [ExerciseType] = [ellipticalWorkout, runningWorkout, rowingWorkout]


print(mondayWorkout)
print("")

print("Instance Methods on Sequence Type:")

print("Drop First: \(mondayWorkout.dropFirst())")
print("")

print("Drop Last: \(mondayWorkout.dropLast())")
print("")

print("Filter: \(mondayWorkout.filter { $0.name == "Treadmill"})")
print("")

print("For Each:")
print("\(mondayWorkout.forEach { print($0.name) })")
print("")

print(mondayWorkout.generate())

print("")   
print(mondayWorkout.map { "No " + $0.title  })
/*
for exercise in mondayWorkout {
    print(exercise.title)
}

print(ellipticalWorkout.title)
print("")
print("Total Calories Burned: \(mondayWorkout.totalCaloriesBurned())")
print("")
print(ellipticalWorkout)
print(runningWorkout)

*/


let string = "hello world"
string.characters.first
string.characters.last
string.characters.count
string.isEmpty
string.startIndex
string.characters.startIndex
string.endIndex
string.characters.endIndex
string.substringFromIndex(string.startIndex.advancedBy(4))



