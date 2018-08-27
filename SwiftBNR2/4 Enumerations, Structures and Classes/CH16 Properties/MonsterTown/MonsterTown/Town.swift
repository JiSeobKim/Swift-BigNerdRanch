//
//  Town.swift
//  MonsterTown
//
//  Created by Brigitte Michau on 2016/01/11.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

// Basic Stored Properties

import Foundation

struct Town {
    
    
    var mayor = Mayor()
    // Constant (read-only) property
    // let region = "South"
    
    // Making region a stored type property
    static let region = "South"
    
    // Variable (read/write) property
    var population = 5422 {
        
        // Property Observers
        didSet(oldPopulation) {

            /// Bronze Challenge
            if population < oldPopulation {
                print("The population has changed to \(population) from \(oldPopulation)")

                // Silver Challenge
                mayor.log()
            }
        }
    }
    var numberOfStoplights = 4
    
    
    // Nested Types
    enum Size {
        case Small
        case Medium
        case Large
    }
    
    /*
    // Lazy Stored Properties
    lazy var townSize: Size = {
    switch self.population {
    case 0...1000:
    return Size.Small
    case 10001...100000:
    return Size.Medium
    default:
    return Size.Large
    }
    }()
    */
    
    // Computed Properties
    // getter: allows you to read data from a property
    // setter: allows you to write data to a property
    
    var townSize: Size {
        get {
            switch self.population {
            case 0...1000:
                return Size.Small
            case 10001...100000:
                return Size.Medium
            default:
                return Size.Large
            }
            
        }
    }
    
    /// An Instance Method: is associated with a particular type
    func printTownDescription() {
        print("Population: \(population) \nNumber of stoplights: \(numberOfStoplights)")
    }
    
    /// Use "Mutating" if an instance method on a Struct changes any of its properties
    mutating func changePopulation(amount: Int) {
        population += amount
    }
}