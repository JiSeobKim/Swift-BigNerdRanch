//
//  Town.swift
//  MonsterTown
//
//  Created by Matthew D. Mathias on 8/22/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

struct Town {
    let region: String
    var population: Int {
        didSet(oldPopulation) {
            print("The population has changed to \(population) from \(oldPopulation).")
        }
    }
    var numberOfStopLights: Int
    
    init?(region: String, population: Int, stopLights: Int) {
        if population <= 0 {
            return nil
        }
        self.region = region
        self.population = population
        numberOfStopLights = stopLights
    }
    
    init?(population: Int, stopLights: Int) {
        self.init(region: "N/A", population: population, stopLights: stopLights)
    }
    
    enum Size {
        case Small
        case Medium
        case Large 
    }
    
    var townSize: Size {
        get {
            precondition(self.population >= 0, "Town cannot have negative population.")
            switch self.population {
            case 0...10000:
                return Size.Small
                
            case 10001...100000:
                return Size.Medium
                
            default:
                return Size.Large
            }
        }
    }
    
    func printTownDescription() {
        print("Population: \(population); number of stop lights: \(numberOfStopLights); region: \(region)")
    }
    
    mutating func changePopulation(amount: Int) {
        population += amount
    }
}