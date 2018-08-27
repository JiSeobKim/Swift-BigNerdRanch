//
//  Vampire.swift
//  MonsterTown
//
//  Created by Brigitte Michau on 2016/01/12.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

class Vampire: Monster {
    
    var vampires = [Vampire]()
    
    override func terrorizeTown() {
        
        if town?.population > 0 {
            town?.changePopulation(-1)
            vampires.append(Vampire())
        }
        
        if town?.population < 0 {
            town?.population = 0
        }
        
        super.terrorizeTown()
    }
}