//
//  Town.swift
//  MonsterTown
//
//  Created by Matthew D. Mathias on 8/22/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

struct Town {
    var population = 5422
    var numberOfStopLights = 4
    
    func printTownDescription() {
        print("Population: \(population); number of stop lights: \(numberOfStopLights)")
    }
    
    mutating func changePopulation(amount: Int) {
        population += amount
    }
}