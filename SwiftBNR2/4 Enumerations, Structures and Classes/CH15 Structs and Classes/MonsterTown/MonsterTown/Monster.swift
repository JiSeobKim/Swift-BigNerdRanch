//
//  Monster.swift
//  MonsterTown
//
//  Created by Brigitte Michau on 2016/01/11.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

class Monster {
    var town: Town?
    var name = "Monster"
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}