//
//  ParticleScene.swift
//  Particles
//
//  Created by Alex Littlejohn on 2015/11/19.
//  Copyright (c) 2015 Alex Littlejohn. All rights reserved.
//

import SpriteKit

class ParticlesScene: SKScene {
    
    var particles = [Particle]()
    
    override init(size: CGSize) {
        super.init(size: size)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        for _ in 0..<ParticleCount {
            let x = random(min: size.width, max: 0)
            let y = random(min: size.height, max: 0)
            let mass = random(min: 8, max: 0.5)
            let particle = Particle(x: x, y: y, mass: mass)
            particles.append(particle)
            addChild(particle)
        }
        
        scaleMode = .aspectFill
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        
        for a in particles {
            
            if random(min: 1, max: 0) < 0.08 {
                a.charge = -a.charge
            }
            
            for b in particles {
                let dx = b.x - a.x
                let dy = b.y - a.y
                let dSq = (dx * dx + dy * dy) + 0.1
                let dst = sqrt(dSq)
                let rad = a.radius + b.radius
                
                if dst >= rad {
                    let len = 1/dst
                    let fx = dx * len
                    let fy = dy * len
                    let f = min(MaximumForce, (Gravity * a.mass * b.mass) / dSq)
                    a.fx += f * fx * b.charge
                    a.fy += f * fy * b.charge
                    b.fx += -f * fx * a.charge
                    b.fy += -f * fx * a.charge
                }
            }
            
            a.vx += a.fx
            a.vy += a.fy
            a.vx *= Friction
            a.vy *= Friction
            a.tail.unshift(element: CGPoint(x: a.x, y: a.y))
            
            if a.tail.count > TailLength {
                _ = a.tail.popLast()
            }
            
            a.x += a.vx
            a.y += a.vy
            a.fx = 0
            a.fy = 0
            
            if a.x > size.width + a.radius {
                a.x = -a.radius
                a.tail = [CGPoint]()
            } else if a.x < -a.radius {
                a.x = size.width + a.radius
                a.tail = [CGPoint]()
            }
            
            if a.y > size.height + a.radius {
                a.y = -a.radius
                a.tail = [CGPoint]()
            } else if a.y < -a.radius {
                a.y = size.height + a.radius
                a.tail = [CGPoint]()
            }
            
            a.lineWidth = a.radius * 2.0
            let path = CGMutablePath()
            path.move(to: CGPoint(x: a.x, y: a.y))
//            CGPathMoveToPoint(path, nil, a.x, a.y)

            for point in a.tail {
                path.addLine(to: point)
//                CGPathAddLineToPoint(path, nil, point.x, point.y)
            }
            
            a.path = path
        }
    }
}
