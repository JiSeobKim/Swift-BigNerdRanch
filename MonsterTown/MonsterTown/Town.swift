//
//  Town.swift
//  MonsterTown
//
//  Created by JiseobKim on 29/08/2018.
//  Copyright © 2018 JiseobKim. All rights reserved.
//

import Foundation

struct Town {
    
    var population = 5_422
    var numberOfStoplights = 4
    
    func printDescription() {
        print("Population: \(population), number of stoplights: \(numberOfStoplights)")
    }
    
    mutating func changePopulation(by amount: Int) {
        if population + amount < 0 {
            population = 0
        } else {
            population += amount
        }
        
    }
}
