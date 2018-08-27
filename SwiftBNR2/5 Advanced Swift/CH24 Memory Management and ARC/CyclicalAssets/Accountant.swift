//
//  Accountant.swift
//  CyclicalAssets
//
//  Created by Brigitte Michau on 2016/02/22.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

class Accountant {
    
    typealias NetWorthChanged = (Double) -> ()
    
    var networthChangedHandler: NetWorthChanged? = nil
    var netWorth: Double = 0.0  {
        didSet {
            networthChangedHandler?(netWorth)
        }
    }
    
    func gainedNewAsset(asset: Asset) {
        netWorth += asset.value
    }
    
    func loseAsset(asset: Asset) {
        netWorth -= asset.value
    }
    
}