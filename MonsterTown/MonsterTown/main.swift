//
//  main.swift
//  MonsterTown
//
//  Created by JiseobKim on 29/08/2018.
//  Copyright © 2018 JiseobKim. All rights reserved.
//

import Foundation


var myTown = Town(population: 0, stoplights: 6)
let myTownSize = myTown?.townSize
print(myTownSize)

myTown?.changePopulation(by: 1_000_000)

//myTown.printDescription()
//
//let genericMonster = Monster()
//
//genericMonster.town = myTown
//genericMonster.terrorizeTown()


var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printDescription()

var convenitentZombie = Zombie(limp: true, fallingApart: false)



print(Zombie.spookyNoise)

if Zombie.isTerryfying {
    print("Run away!")
}

fredTheZombie = nil

//let fredTheVampire = Vampire(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")



//print(Zombie.spookyNoise)
//if Zombie.isTerryfying {
//    print("Run away!!!")
//}

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
