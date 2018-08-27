//
//  Accountant.swift
//  CyclicalAssets
//
//  Created by John Gallagher on 10/2/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

import Foundation

class Accountant {
    typealias NetWorthChanged = (Double) -> ()

    var netWorthChangedHandler: NetWorthChanged? = nil
    var netWorth: Double = 0.0 {
        didSet {
            netWorthChangedHandler?(netWorth)
        }
    }

    func gainedNewAsset(asset: Asset) {
        netWorth += asset.value
    }
}
