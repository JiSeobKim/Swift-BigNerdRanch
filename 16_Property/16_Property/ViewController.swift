//
//  ViewController.swift
//  16_Property
//
//  Created by JiseobKim on 27/08/2018.
//  Copyright © 2018 JiseobKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


struct Town {
    let region = "South"
    var population = 5_422
    var numberOfStoplights = 4
    
    enum Size {
        case small
        case medium
        case large
    }
    
    lazy var townSize: Size = {
        switch self.population {
        case 0...10_000:
            return Size.small
        case 10_001...100_000:
            return Size.medium
        default :
            return Size.large
        }
    }()
    
    func printDescription() {
        print("Population: \(population) number of stoplights: \(numberOfStoplights)")
    }
    
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
}
