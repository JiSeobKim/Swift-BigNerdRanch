//
//  Town.swift
//  MonsterTown
//
//  Created by Brigitte Michau on 2016/01/11.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

struct Town {
    var population = 8 // 5422
    var numberOfStoplights = 4
    
    
    /// An Instance Method: is associated with a particular type
    func printTownDescription() {
    print("Population: \(population) \nNumber of stoplights: \(numberOfStoplights)")
    }
    
    /// Use "Mutating" if an instance method on a Struct changes any of its properties
    mutating func changePopulation(amount: Int) {
        population += amount
    }
}