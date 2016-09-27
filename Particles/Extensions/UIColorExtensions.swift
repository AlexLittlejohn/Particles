//
//  UIColorExtensions.swift
//  Particles
//
//  Created by Alex Littlejohn on 2015/11/19.
//  Copyright © 2015 Alex Littlejohn. All rights reserved.
//

import UIKit

private func extractColorComponent(colorString: String, start: Int, length: Int) -> CGFloat {
    let substring = colorString.subString(start: start, length: length)
    let fullHex = length == 2 ? substring : substring + substring
    var hexComponent:CUnsignedInt = 0
    Scanner(string: fullHex).scanHexInt32(&hexComponent)
    return CGFloat(hexComponent) / CGFloat(255)
}

/// String init
extension UIColor {
    convenience init(hex: String) {
        let colorString = hex.replacingOccurrences(of: "#", with: "")
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        switch colorString.lengthOfBytes(using: String.Encoding.utf8) {
        case 3:
            red = extractColorComponent(colorString: colorString, start: 0, length: 1)
            green = extractColorComponent(colorString: colorString, start: 1, length: 1)
            blue = extractColorComponent(colorString: colorString, start: 2, length: 1)
            alpha = 1.0
        case 4:
            red = extractColorComponent(colorString: colorString, start: 0, length: 1)
            green = extractColorComponent(colorString: colorString, start: 1, length: 1)
            blue = extractColorComponent(colorString: colorString, start: 2, length: 1)
            alpha = extractColorComponent(colorString: colorString, start: 3, length: 1)
        case 6:
            red = extractColorComponent(colorString: colorString, start: 0, length: 2)
            green = extractColorComponent(colorString: colorString, start: 2, length: 2)
            blue = extractColorComponent(colorString: colorString, start: 4, length: 2)
            alpha = 1.0
        case 8:
            red = extractColorComponent(colorString: colorString, start: 0, length: 2)
            green = extractColorComponent(colorString: colorString, start: 2, length: 2)
            blue = extractColorComponent(colorString: colorString, start: 4, length: 2)
            alpha = extractColorComponent(colorString: colorString, start: 6, length: 2)
            
        default:
            fatalError("Color value \(hex) is invalid.  It should be a hex value of the form #RBG, #RGBA, #RRGGBB, or #RRGGBBAA")
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
