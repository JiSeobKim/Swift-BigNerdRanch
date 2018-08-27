//: Chapter 13 - Closures
//: =====================

import Cocoa

//: 🏅 Gold Challenge

let precinctPopulations = [1244, 2021, 2157]

let projectedPopulation =
precinctPopulations.map { $0 * 2 }

let totalProjection =
projectedPopulation.reduce(0) { $0 + $1 }


let alsoBigProjetion =
projectedPopulation.filter { $0 > 4000 }


//: Closure Syntax
//: --------------

//: Starting with an array

var volunteerCounts = [1,3,40,32,2,53,77,13]

//: Sorting the array

func sortAscending(i: Int, j: Int) -> Bool {
    return i < j
}

let volunteersSorted = volunteerCounts.sort(sortAscending)

//: Closure Expression Syntax
//: -------------------------

let inlineVolunteersSorted = volunteerCounts.sort({
    (i: Int, j: Int) -> Bool in
    return i < j
})

//: Taking advantage of type inference

let inferedVolunteersSorted = volunteerCounts.sort({ i, j in i < j })

//: Using shorthand syntax for arguments

let shorthandVolunteersSorted = volunteerCounts.sort { $0 < $1 }

let vSorted = volunteerCounts.sort(<)

//: Functions as Return Types
//: -------------------------

func makeTownGrand() -> (Int, Int) -> Int {
    func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
        return toLights + lightsToAdd
    }
    return buildRoads
}

var stopLights = 4
let townPlan = makeTownGrand()
stopLights = townPlan(4,stopLights)

//: Functions as Arguments
//: ----------------------

func makeTownGrandWithBudget(budget: Int, condition: Int -> Bool) ->
    ((Int, Int) -> Int)? {
        
        if condition(budget) {
            func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
                return toLights + lightsToAdd
            }
            return buildRoads
        } else {
            return nil
        }
}

func evaluateBudget(budget: Int) -> Bool {
    return budget > 10000
}

stopLights = 4

if let townPlan = makeTownGrandWithBudget(100000, condition: evaluateBudget) {
    stopLights = townPlan(4,stopLights)
}

//: Closures Capture Values
//: -----------------------

func makeGrowthTracker(forGrowth growth: Int) -> () -> Int {
    var totalGrowth = 0
    
    func growthTracker() -> Int {
        totalGrowth += growth
        return totalGrowth
    }
    
    return growthTracker
}

var currentPopulation = 5422
let growBy500 = makeGrowthTracker(forGrowth: 500)
growBy500()
growBy500()
growBy500()
currentPopulation += growBy500()

//: Closures are Refrence Types
//: ---------------------------

let anotherGrowBy500 = growBy500
anotherGrowBy500()

var someOtherPopulation = 40661981
let growBy1000 = makeGrowthTracker(forGrowth: 10000)
someOtherPopulation += growBy1000()
currentPopulation

//: Functional Programming
//: ----------------------

//: Higher-order functions

//: Map

//let precinctPopulations = [1244, 2021, 2157]
//
//let projectedPopulation = precinctPopulations.map {
//    (population: Int) -> Int in
//    return population * 2
//}
//
//let alsoProjectedPopulation = precinctPopulations.map { $0 * 2 }
//
////: Filter
//
//let bigProjections = projectedPopulation.filter {
//    (projection: Int) -> Bool in
//    return projection > 4000
//}
//
//let alsoBigProjetion = projectedPopulation.filter { $0 > 4000 }
//
////: Reduce
//
//let totalProjection = projectedPopulation.reduce(0) { (accumulatedProjection: Int, precintProjection: Int) -> Int in
//    return accumulatedProjection + precintProjection
//}

totalProjection
