//
//  main.swift
//  MonsterTown
//
//  Created by Brigitte Michau on 2016/01/11.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

var myTown = Town()


/*

/// Calling an instance method

myTown.changePopulation(500)
myTown.printTownDescription()

let gm = Monster()
gm.town = myTown
gm.terrorizeTown()

*/

/*
let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()

fredTheZombie.changeName("Fred the Zombie", walksWithLimp: false)
*/


/// Silver Challenge

let someVampire = Vampire()
someVampire.town = myTown
someVampire.terrorizeTown()
someVampire.town?.printTownDescription()

someVampire.terrorizeTown()
someVampire.terrorizeTown()


print("Vampire Count \(someVampire.vampires.count)")

if let population = someVampire.town?.population {
    print("Town's population \(population)")
}
