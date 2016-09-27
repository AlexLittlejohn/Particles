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
        let fromIndex = index(startIndex, offsetBy: start)
        let toIndex = index(fromIndex, offsetBy: length)
        return substring(with: Range<String.Index>(uncheckedBounds: (lower: fromIndex, upper: toIndex)))
    }
}
