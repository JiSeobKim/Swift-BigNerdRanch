//
//  Vampire.swift
//  MonsterTown
//
//  Created by JiseobKim on 29/08/2018.
//  Copyright © 2018 JiseobKim. All rights reserved.
//

import Foundation


class Vampire: Monster {
    
    var vampireArray: [Vampire] = []
    
    override func terrorizeTown() {
        super.terrorizeTown()
        
        self.town?.changePopulation(by: -1)
        
//        guard self.town != nil else { return }
//        vampireArray.append(Vampire())
    }
    
    func vampireCount() {
        print("Vampire Count : \(self.vampireArray.count)")
    }
    
    class func makeSpookyNoise() -> String {
        return "Brains.."
    }
}


struct Square {
    static func numberOfSides() -> Int {
        return 4
    }
}

class GiantZombie: Vampire {
    override class func makeSpookyNoise() -> String {
        return "ROAR!!"
    }
}
