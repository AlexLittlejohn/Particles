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
    var charge: CGFloat = [1, -1].random()!
    var color = Colors.random()!
    var fx: CGFloat = 0
    var fy: CGFloat = 0
    var vx: CGFloat = 0
    var vy: CGFloat = 0
    
    var tail = [CGPoint]()
    
    init(x: CGFloat, y: CGFloat, mass: CGFloat) {
        
        self.x = x
        self.y = y
        self.mass = mass
        self.radius = mass * 0.15
        
        super.init()
        
        strokeColor = color
        lineCap = CGLineCap.round
    }
    
    required init?(coder aDecoder: NSCoder) {
        let size = UIScreen.main.bounds.size
        
        x = random(min: 0, max: size.width)
        y = random(min: 0, max: size.height)
        mass = random(min: 0.5, max: 8)
        radius = mass * 0.15
        
        super.init(coder: aDecoder)
    }
}
