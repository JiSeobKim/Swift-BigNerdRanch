//
//  Mayor.swift
//  MonsterTown
//
//  Created by Brigitte Michau on 2016/01/13.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

struct Mayor {
    
    private var anxietyLevel = 0

    mutating func log() {

        print(anxietyLevel++)
        
        print("I'm deeply saddened to hear about the latest tragedy. I promise that my office is looking into the nature of this rash of violence")
    }
}