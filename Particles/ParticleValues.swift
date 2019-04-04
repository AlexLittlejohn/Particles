//
//  ParticleValues.swift
//  Particles
//
//  Created by Alex Littlejohn on 2015/11/19.
//  Copyright © 2015 Alex Littlejohn. All rights reserved.
//

import UIKit

/// Colors for the lines - chosen randomly
struct ParticleValues {
    /// Higher = more particles
    let particleCount: Int
    
    /// Higher = longer tails
    let tailLength: Int
    
    // Physics
    let maximumForce: CGFloat
    let friction: CGFloat
    let gravity: CGFloat
    
    /// Colors for the lines - chosen randomly
    let colors: [UIColor]
    
    init(particleCount: Int = 65, tailLength: Int = 12, maximumForce: CGFloat = 8, friction: CGFloat = 0.75, gravity: CGFloat = 9.81, colors: [UIColor]) {
        guard !colors.isEmpty else { fatalError("Particles need at least 1 color to render") }

        self.particleCount = particleCount
        self.tailLength = tailLength
        self.maximumForce = maximumForce
        self.friction = friction
        self.gravity = gravity
        self.colors = colors
    }
}
