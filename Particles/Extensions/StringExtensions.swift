//
//  StringExtensions.swift
//  Particles
//
//  Created by Alex Littlejohn on 2015/11/19.
//  Copyright © 2015 Alex Littlejohn. All rights reserved.
//

import Foundation

extension String {
    func subString(start: Int, length: Int) -> String {
        let _start = startIndex.advancedBy(start)
        let _end = startIndex.advancedBy(start + length)
        return substringWithRange(Range<String.Index>(start: _start, end: _end))
    }
}
