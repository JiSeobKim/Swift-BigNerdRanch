//
//  Zombie.swift
//  MonsterTown
//
//  Created by Matthew D. Mathias on 8/28/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

class Zombie: Monster {
    override class var spookyNoise: String {
        return "Brains..."
    }
    
    var walksWithLimp = false
    private(set) var isFallingApart = false
    
    override func terrorizeTown() {
        if !isFallingApart {
            town?.changePopulation(-10)
        }
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
}