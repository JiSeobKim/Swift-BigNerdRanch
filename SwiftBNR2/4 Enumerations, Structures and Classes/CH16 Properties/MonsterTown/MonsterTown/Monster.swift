//
//  Monster.swift
//  MonsterTown
//
//  Created by Brigitte Michau on 2016/01/11.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

class Monster {
    
    // Static property
    static let isTerrifying = true
    
    // Generic Monster noise
    class var spookyNoise: String {
        return "Grr"
    }
    
    var town: Town?
    var name = "Monster"
    
    // Computed property  with getter an setter 
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set (newVictimPool) {
            town?.population -= newVictimPool
        }
//        the same as
//        set {
//            town?.population = newValue
//        }
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}