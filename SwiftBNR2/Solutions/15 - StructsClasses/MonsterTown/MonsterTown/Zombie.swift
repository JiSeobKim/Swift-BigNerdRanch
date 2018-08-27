//
//  Zombie.swift
//  MonsterTown
//
//  Created by Matthew D. Mathias on 8/28/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

class Zombie: Monster {
    class func makeSpookyNoise() -> String {
        return "Brains..."
    }
    
    var walksWithLimp = true
    
    final override func terrorizeTown() {
        town?.changePopulation(-10)
        super.terrorizeTown()
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
}