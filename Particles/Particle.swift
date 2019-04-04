//
//  Particle.swift
//  Particles
//
//  Created by Alex Littlejohn on 2015/11/19.
//  Copyright © 2015 Alex Littlejohn. All rights reserved.
//

import Foundation
import SpriteKit

class Particle: SKShapeNode {
    
    var x: CGFloat
    var y: CGFloat
    var mass: CGFloat
    var radius: CGFloat
    var charge: CGFloat = CGFloat.random(in: -1...1)
    var fx: CGFloat = 0
    var fy: CGFloat = 0
    var vx: CGFloat = 0
    var vy: CGFloat = 0
    var tail: [CGPoint] = []
    
    init(x: CGFloat, y: CGFloat, mass: CGFloat, color: UIColor) {
        
        self.x = x
        self.y = y
        self.mass = mass
        self.radius = mass * 0.15
        
        super.init()
        
        strokeColor = color
        lineCap = CGLineCap.round
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
