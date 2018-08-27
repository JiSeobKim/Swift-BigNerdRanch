//
//  Person.swift
//  CyclicalAssets
//
//  Created by Brigitte Michau on 2016/02/20.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    
    let name: String
    let accountant = Accountant()
    var assets = [Asset]()
    
    var description: String {
        return "Person (\(name))"
    }
    
    init(name: String) {
        self.name = name
        
        accountant.networthChangedHandler = {
            [weak self] networth in
            self?.netWorthDidChange(networth)
            return
        }
    }
    
    deinit {
        print("\(self)  is being deallocated")
    }
    
    func takeOwnershipOfAsset(asset: Asset) {
        asset.owner = self
        assets.append(asset)
        accountant.gainedNewAsset(asset)
    }
    
    func relinquishAsset(asset: Asset) {
        asset.owner = nil
        removeAsetFromAssets(asset)
        accountant.loseAsset(asset)
    }
    
    func removeAsetFromAssets(asset: Asset) {
        var i = 0
        for (index, a) in assets.enumerate() {
            if asset === a {
                i = index
                assets.removeAtIndex(i)
                continue
            }
        }
    }
    
    func netWorthDidChange(netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth)")
    }
}