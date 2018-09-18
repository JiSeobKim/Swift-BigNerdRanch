//
//  main.swift
//  MonsterTown
//
//  Created by JiseobKim on 29/08/2018.
//  Copyright © 2018 JiseobKim. All rights reserved.
//

import Foundation


var myTown = Town()
let myTownSize = myTown.townSize

myTown.changePopulation(by: 1_000_000)

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

print(Zombie.spookyNoise)
if Zombie.isTerryfying {
    print("Run away!!!")
}

//print("Victim pool: \(fredTheVampire.victimPool)")
//fredTheVampire.victimPool = 500
//print("Victim pool: \(fredTheVampire.victimPool) population: \(fredTheVampire.town?.population ?? 0)")
//
//print(Zombie.spookyNoise)
//
//
//print(Square.numberOfSides())
//
//print(Vampire.makeSpookyNoise())
//print(GiantZombie.makeSpookyNoise())
