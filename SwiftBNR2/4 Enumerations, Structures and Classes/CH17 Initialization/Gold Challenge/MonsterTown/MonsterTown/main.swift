//
//  main.swift
//  MonsterTown
//
//  Created by Matthew D. Mathias on 8/22/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

var myTown = Town(population: 0, stopLights: 4)
myTown?.printTownDescription()

let ts = myTown?.townSize
print(ts)

myTown?.changePopulation(1000000)
print("Size: \(myTown?.townSize); population: \(myTown?.population)")

// Testing Gold Challenge
var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "")

fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printTownDescription()

var convenientZombie = Zombie(limp: true, fallingApart: false)

print("Victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500
print("Victim pool: \(fredTheZombie?.victimPool)")

print(Zombie.spookyNoise)
fredTheZombie = nil
