//
//  KeyChainWrapper.swift
//  albumapp
//
//  Created by Ravulavaru, Arvind on 10/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class KeyChainWrapper {

    func set (key: String, value: String) -> Bool {
        let saveSuccessful: Bool = KeychainWrapper.standard.set(value, forKey: key)
        print("Save was successful: \(saveSuccessful)")
        return saveSuccessful
    }

    func get (key: String) -> String {
        let value: String? = KeychainWrapper.standard.string(forKey: key)
        print("Fetch - \(key): \(value!)")
        if let value = value {
            return value
        } else {
            return ""
        }
    }

    func remove (key: String) {
        let removeSuccessful: Bool = KeychainWrapper.standard.removeObject(forKey: key)
        print("Remove was successful: \(removeSuccessful)")
    }
}
