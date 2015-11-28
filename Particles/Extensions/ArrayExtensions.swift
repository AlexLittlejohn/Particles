//
//  ArrayExtensions.swift
//  Particles
//
//  Created by Alex Littlejohn on 2015/11/28.
//  Copyright © 2015 Alex Littlejohn. All rights reserved.
//

import Foundation

extension Array {
    mutating func unshift(element: Generator.Element) {
        insert(element, atIndex: 0)
    }
}

func random<C: CollectionType where C.Index.Distance == Int>(array: C) -> C.Generator.Element? {
    if array.isEmpty { return nil }
    let len = array.count
    let off = Int(arc4random_uniform(UInt32(len)))
    let idx = array.startIndex.advancedBy(off)
    return array[idx]
}