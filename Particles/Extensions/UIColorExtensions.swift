//
//  UIColorExtensions.swift
//  Particles
//
//  Created by Alex Littlejohn on 2015/11/19.
//  Copyright © 2015 Alex Littlejohn. All rights reserved.
//

import UIKit

private func extractColorComponent(colorString: String, start: Int, length: Int) -> CGFloat {
    let substring = colorString.subString(start, length: length)
    let fullHex = length == 2 ? substring : substring + substring
    var hexComponent:CUnsignedInt = 0
    NSScanner(string: fullHex).scanHexInt(&hexComponent)
    return CGFloat(hexComponent) / CGFloat(255)
}

/// String init
extension UIColor {
    convenience init(hex: String) {
        let colorString = hex.stringByReplacingOccurrencesOfString("#", withString: "").uppercaseString
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        switch colorString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) {
        case 3:
            red = extractColorComponent(colorString, start: 0, length: 1)
            green = extractColorComponent(colorString, start: 1, length: 1)
            blue = extractColorComponent(colorString, start: 2, length: 1)
            alpha = 1.0
        case 4:
            red = extractColorComponent(colorString, start: 0, length: 1)
            green = extractColorComponent(colorString, start: 1, length: 1)
            blue = extractColorComponent(colorString, start: 2, length: 1)
            alpha = extractColorComponent(colorString, start: 3, length: 1)
        case 6:
            red = extractColorComponent(colorString, start: 0, length: 2)
            green = extractColorComponent(colorString, start: 2, length: 2)
            blue = extractColorComponent(colorString, start: 4, length: 2)
            alpha = 1.0
        case 8:
            red = extractColorComponent(colorString, start: 0, length: 2)
            green = extractColorComponent(colorString, start: 2, length: 2)
            blue = extractColorComponent(colorString, start: 4, length: 2)
            alpha = extractColorComponent(colorString, start: 6, length: 2)
            
        default:
            fatalError("Color value \(hex) is invalid.  It should be a hex value of the form #RBG, #RGBA, #RRGGBB, or #RRGGBBAA")
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
