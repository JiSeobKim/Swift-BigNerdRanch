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
    var walkWithLimp: Bool
    private(set) var isFallingApart: Bool
    
    init(limp:Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walkWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    
    convenience init(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walkWithLimp {
            print("This zombie has a bad knee.")
        }
    }
    
    required init(town: Town?, monsterName: String) {
        walkWithLimp = false
        isFallingApart = false
        super.init(town: town, monsterName: monsterName)
    }
    
    override func terrorizeTown() {
        super.terrorizeTown()
        if !isFallingApart {
            town?.changePopulation(by: -10)
        }
    }
}
