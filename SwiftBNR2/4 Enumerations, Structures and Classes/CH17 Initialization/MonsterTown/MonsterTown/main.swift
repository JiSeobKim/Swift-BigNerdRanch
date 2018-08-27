//
//  main.swift
//  MonsterTown
//
//  Created by Matthew D. Mathias on 8/22/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

//var myTown = Town()

/// Using a memberwise initializer
// var myTown = Town(population: 1000, numberOfStopLights: 6,
// var myTown = Town(region: "West", population: 10000, stoplights: 6)
var myTown = Town(population: -1, stoplights: 6)

myTown?.printTownDescription()

let ts = myTown?.townSize
print(ts)

myTown?.changePopulation(1000000)
print("Size: \(myTown?.townSize); population: \(myTown?.population)")

//let fredTheZombie = Zombie()
//fredTheZombie.town = myTown

// let fredTheZombie = Zombie(town: myTown, monsterName: "Fred")
var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printTownDescription()

var convenientZombie = Zombie(limp: true, fallingApart: false)

//let z1 = Zombie()
//z1.walksWithLimp = false
//let z2 = z1
//z2.walksWithLimp = true
//print("z1 walks with limp? \(z1.walksWithLimp); z2 walks with limp? \(z2.walksWithLimp)")
//fredTheZombie.changeName("Fred the Zombie", walksWithLimp: false)

print("Victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500
print("Victim pool: \(fredTheZombie?.victimPool)")

print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}

fredTheZombie = nil 