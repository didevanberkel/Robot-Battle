//
//  Character.swift
//  Robot-Battle
//
//  Created by Dide van Berkel on 27-02-16.
//  Copyright © 2016 Gary Grape Productions. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 100
    private var _attackPower: Int = 20
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    init(startingHp: Int, attackPower: Int) {
        self._hp = startingHp
        self._attackPower = attackPower
    }
    
    func attack(atackPower: Int) -> Bool {
        self._hp -= attackPower
        return true
    }
}