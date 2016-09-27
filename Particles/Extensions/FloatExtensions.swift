//
//  FloatExtensions.swift
//  Particles
//
//  Created by Alex Littlejohn on 2015/11/19.
//  Copyright © 2015 Alex Littlejohn. All rights reserved.
//

import CoreGraphics

public extension CGFloat {
    public static func random() -> CGFloat {
        return CGFloat(arc4random()) / 0xFFFFFFFF
    }
}

func random(min: CGFloat, max: CGFloat) -> CGFloat {
    return CGFloat.random() * (max - min) + min
}
