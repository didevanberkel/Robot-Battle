//
//  BB-8.swift
//  Robot-Battle
//
//  Created by Dide van Berkel on 27-02-16.
//  Copyright © 2016 Gary Grape Productions. All rights reserved.
//

import Foundation

class BB8: Character {
    
    private var _name = "BB-8"
    
    var name: String {
        get {
            return _name
        }
    }
    
    convenience init(name: String, hp: Int, attackPower: Int) {
        self.init(startingHp: hp, attackPower: attackPower)
        
        _name = name
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
}