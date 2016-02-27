//
//  Player.swift
//  Robot-Battle
//
//  Created by Dide van Berkel on 27-02-16.
//  Copyright © 2016 Gary Grape Productions. All rights reserved.
//

import Foundation

class Player: Character {
    
    private var _playerName = "Name"
    
    var playerName: String {
        get {
            return _playerName
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        return _inventory
    }
    
    func AddItemToInventory(item: String) {
        _inventory.append(item)
    }
    
}