//
//  main.swift
//  MonsterTown
//
//  Created by JiseobKim on 29/08/2018.
//  Copyright © 2018 JiseobKim. All rights reserved.
//

import Foundation


var myTown = Town()

myTown.changePopulation(by: -5400)
//myTown.printDescription()
//
//let genericMonster = Monster()
//
//genericMonster.town = myTown
//genericMonster.terrorizeTown()


//let fredTheZombie = Zombie()
//fredTheZombie.town = myTown
//fredTheZombie.terrorizeTown()
//fredTheZombie.town?.printDescription()


let fredTheVampire = Vampire()

fredTheVampire.town = myTown




print(Square.numberOfSides())

print(Vampire.makeSpookyNoise())
print(GiantZombie.makeSpookyNoise())
