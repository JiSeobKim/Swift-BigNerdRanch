//
//  Monster.swift
//  MonsterTown
//
//  Created by JiseobKim on 29/08/2018.
//  Copyright © 2018 JiseobKim. All rights reserved.
//

import Foundation


class Monster {
    static let isTerryfying = true
    class var spookyNoise: String{
        return "Grrr"
    }
    var town: Town?
    var name = "Monster"
    
    
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set {
            town?.population = newValue
        }
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else{
            print("\(name) hasn't found a town to terroize yet...")
        }
    }
}
