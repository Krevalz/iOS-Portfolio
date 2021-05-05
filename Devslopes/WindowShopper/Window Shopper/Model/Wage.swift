//
//  Wage.swift
//  Window Shopper
//
//  Created by Joshua Ramos on 8/3/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import Foundation

class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage)) // rounds up
    }
}
