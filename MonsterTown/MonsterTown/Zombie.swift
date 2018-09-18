//
//  Zombie.swift
//  MonsterTown
//
//  Created by JiseobKim on 29/08/2018.
//  Copyright © 2018 JiseobKim. All rights reserved.
//

import Foundation


class Zombie: Monster {
    override class var spookyNoise: String{
        return "Brains..."
    }
    var walkWithLimp = true
    
    override func terrorizeTown() {
        super.terrorizeTown()
        town?.changePopulation(by: -10)
        
    }
}
