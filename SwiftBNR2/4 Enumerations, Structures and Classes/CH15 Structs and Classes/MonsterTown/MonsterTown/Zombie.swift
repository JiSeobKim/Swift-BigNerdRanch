//
//  Zombie.swift
//  MonsterTown
//
//  Created by Brigitte Michau on 2016/01/11.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

class Zombie: Monster {
    
    var walksWithLimp = true
    
    /// Override: Subclass provides its own definition of a method that is defined in the superclass
    /// Final: Subclass of Zombie will not be able to override terrorizeTown()
    
    ///  Bronze challenge
    final override func terrorizeTown() {
        
        if (town?.population)! > 0 {
            town?.changePopulation(amount: -10)
        }
        
        if (town?.population)! < 0 {
            town?.population = 0
        }
        
        super.terrorizeTown()
    }
    
    /// Methods parameter names
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
    
    class func makeSpookyNoise() -> String {
        return "Brains..."
    }
}
