//
//  Person.swift
//  CyclicalAssets
//
//  Created by John Gallagher on 10/1/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

import Foundation

class Person : CustomStringConvertible {
    let name: String
    let accountant = Accountant()
    var assets = [Asset]()

    var description: String {
        return "Person(\(name))"
    }

    init(name: String) {
        self.name = name

        accountant.netWorthChangedHandler = {
            [weak self] netWorth in

            self?.netWorthDidChange(netWorth) ?? ()
            return
        }
    }

    deinit {
        print("\(self) is being deallocated")
    }

    func takeOwnershipOfAsset(asset: Asset) {
        asset.owner = self
        assets.append(asset)
        accountant.gainedNewAsset(asset)
    }

    func netWorthDidChange(netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth)")
    }
}
