//
//  main.swift
//  MonsterTown
//
//  Created by Matthew D. Mathias on 8/22/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

var myTown = Town()

let ts = myTown.townSize
print(ts)

myTown.changePopulation(1000000)
print("Size: \(myTown.townSize); population: \(myTown.population)")

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()
let z1 = Zombie()
z1.walksWithLimp = false
let z2 = z1
z2.walksWithLimp = true
print("z1 walks with limp? \(z1.walksWithLimp); z2 walks with limp? \(z2.walksWithLimp)")
fredTheZombie.changeName("Fred the Zombie", walksWithLimp: false)

print("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print("Victim pool: \(fredTheZombie.victimPool)")

print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}