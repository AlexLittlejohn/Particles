//
//  ParticleScene.swift
//  Particles
//
//  Created by Alex Littlejohn on 2015/11/19.
//  Copyright (c) 2015 Alex Littlejohn. All rights reserved.
//

import SpriteKit

class ParticlesScene: SKScene {
    
    var particles: [Particle] = []
    var values: ParticleValues {
        didSet {
            setup()
        }
    }
    
    required init(size: CGSize, values: ParticleValues) {
        self.values = values
        super.init(size: size)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        
        removeAllChildren()
        
        (0..<values.particleCount).forEach { _ in
            let x = CGFloat.random(in: 0...size.width)
            let y = CGFloat.random(in: 0...size.height)
            let mass = CGFloat.random(in: 0.5...8)
            let color = values.colors[Int.random(in: 0..<values.colors.count)]
            let particle = Particle(x: x, y: y, mass: mass, color: color)
            particles.append(particle)
            addChild(particle)
        }
        
        scaleMode = .aspectFill
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        
        particles.forEach { particle in
            
            if CGFloat.random(in: 0...1) < 0.08 {
                particle.charge = -particle.charge
            }
            
            for b in particles {
                let dx = b.x - particle.x
                let dy = b.y - particle.y
                let dSq = (dx * dx + dy * dy) + 0.1
                let dst = sqrt(dSq)
                let rad = particle.radius + b.radius
                
                if dst >= rad {
                    let len = 1/dst
                    let fx = dx * len
                    let fy = dy * len
                    let f = min(values.maximumForce, (values.gravity * particle.mass * b.mass) / dSq)
                    particle.fx += f * fx * b.charge
                    particle.fy += f * fy * b.charge
                    b.fx += -f * fx * particle.charge
                    b.fy += -f * fx * particle.charge
                }
            }
            
            particle.vx += particle.fx
            particle.vy += particle.fy
            particle.vx *= values.friction
            particle.vy *= values.friction
            particle.tail.insert(CGPoint(x: particle.x, y: particle.y), at: 0)
            
            if particle.tail.count > values.tailLength {
                _ = particle.tail.popLast()
            }
            
            particle.x += particle.vx
            particle.y += particle.vy
            particle.fx = 0
            particle.fy = 0
            
            if particle.x > size.width + particle.radius {
                particle.x = -particle.radius
                particle.tail = []
            } else if particle.x < -particle.radius {
                particle.x = size.width + particle.radius
                particle.tail = []
            }
            
            if particle.y > size.height + particle.radius {
                particle.y = -particle.radius
                particle.tail = []
            } else if particle.y < -particle.radius {
                particle.y = size.height + particle.radius
                particle.tail = []
            }
            
            particle.lineWidth = particle.radius * 2.0
            let path = CGMutablePath()
            path.move(to: CGPoint(x: particle.x, y: particle.y))

            for point in particle.tail {
                path.addLine(to: point)
            }
            
            particle.path = path
        }
    }
}
