//
//  Town.swift
//  MonsterTown
//
//  Created by Matthew D. Mathias on 8/22/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

struct Town {
    static let region = "South"
    var population = 5422 {
        didSet(oldPopulation) {
            print("The population has changed to \(population) from \(oldPopulation).")
        }
    }
    var numberOfStopLights = 4
    
    enum Size {
        case Small
        case Medium
        case Large
    }
    
    var townSize: Size {
        get {
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
        print("Population: \(population); number of stop lights: \(numberOfStopLights)")
    }
    
    mutating func changePopulation(amount: Int) {
        population += amount
    }
}