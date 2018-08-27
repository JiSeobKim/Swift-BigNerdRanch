//
//  main.swift
//  CyclicalAssets
//
//  Created by Brigitte Michau on 2016/02/20.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

// People
var bob: Person? = Person(name: "Bob")
print("Created \(bob)")

var joe: Person? = Person(name: "Joe")
print("Created \(joe)")


// Assets
var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1500.00)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.00)
var backpack: Asset? = Asset(name: "Blue Backpack", value: 45.0)

if let laptop = laptop {
    bob?.takeOwnershipOfAsset(laptop)
    joe?.takeOwnershipOfAsset(laptop)
    print(laptop.owner)
}

if let hat = hat {
    bob?.takeOwnershipOfAsset(hat)
}

if let hat = hat {
    bob?.relinquishAsset(hat)
    print("Bob Relinquised his hat. Owner of the \(hat.owner)")
}

print("While Bob is alive, hat's owner is \(hat!.owner)")

bob = nil
print("the bob variable is now \(bob)")
print("After Bob is deallocated, hat's owner is \(hat!.owner)")


laptop = nil
hat = nil
backpack = nil