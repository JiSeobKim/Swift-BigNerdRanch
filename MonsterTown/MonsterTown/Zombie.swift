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
    private(set) var isFallingApart = false
    
    override func terrorizeTown() {
        super.terrorizeTown()
        if !isFallingApart {
            town?.changePopulation(by: -10)
        }
    }
}
