//
//  Asset.swift
//  CyclicalAssets
//
//  Created by Brigitte Michau on 2016/02/20.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

class Asset: CustomStringConvertible {
    let name: String
    let value: Double
    
    typealias OwnerWillChange = (Person) -> ()
    
    var ownerWillChangeHandler: OwnerWillChange? = nil
    
    weak var owner: Person? {
        willSet {
            if let owner = owner {
                ownerWillChangeHandler?(owner)
//                owner.relinquishAsset(self)
            }
        }
    }
    
    var description: String {
        if let actualOwner = owner {
            return "Asset(\(name), worth \(value), owned by \(actualOwner))"
        } else {
            return "Asset(\(name), worth \(value), not owned by anyone))"
        }
    }
    
    init(name: String, value: Double) {
        self.name = name
        self.value = value
        
        ownerWillChangeHandler = {
            [weak self] asset in
            self?.ownerWillChangeHandler!(asset)
            return
        }
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
}

