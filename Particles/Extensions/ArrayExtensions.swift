//
//  ArrayExtensions.swift
//  Particles
//
//  Created by Alex Littlejohn on 2015/11/28.
//  Copyright © 2015 Alex Littlejohn. All rights reserved.
//

import Foundation

extension Array {
    mutating func unshift(element: Element) {
        insert(element, at: 0)
    }
}

extension Array {
    func random() -> Element? {
        if isEmpty { return nil }
        let idx = Int(arc4random_uniform(UInt32(count)))
        return self[idx]
        
    }
}


