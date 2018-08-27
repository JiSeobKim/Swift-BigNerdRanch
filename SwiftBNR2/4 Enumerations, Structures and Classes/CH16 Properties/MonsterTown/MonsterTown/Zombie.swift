//
//  Zombie.swift
//  MonsterTown
//
//  Created by Brigitte Michau on 2016/01/11.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

class Zombie: Monster {

    // Computed property
    // Subclasses cannot override a type property from their super class. If you want a subclass to be able to provide its own implementation of the property, use  the class keyword instead
    override class var spookyNoise: String {
        return "Brains...."
    }
    
    var walksWithLimp = true
    
    
    // private var isFallingApart = false
    /// Making the getter internal and the setter private
    // internal private(set) var isFallingApart = false
    /// the setter can not be more visible that the getter
    /// Using default getter visibility
    private(set) var isFallingApart = false
    
    
    
    /// Override: Subclass provides its own definition of a method that is defined in the superclass
    /// Final: Subclass of Zombie will not be able to override terrorizeTown()
    
    ///  Bronze challenge
    final override func terrorizeTown() {
        
        if !isFallingApart {
         town?.changePopulation(-10)
        }
        
        super.terrorizeTown()
    }
    
    /// Methods parameter names
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }

    /*
    class func makeSpookyNoise() -> String {
        return "Brains..."
    }
    */
}