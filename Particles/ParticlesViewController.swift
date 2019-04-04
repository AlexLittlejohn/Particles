//
//  ParticlesViewController.swift
//  Particles
//
//  Created by Alex Littlejohn on 2015/11/19.
//  Copyright (c) 2015 Alex Littlejohn. All rights reserved.
//

import UIKit
import SpriteKit

class ParticlesViewController: UIViewController {

    lazy var spriteKitView = SKView()
    
    override func loadView() {
        view = spriteKitView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colors = [
            UIColor(red: 255/255, green: 71/255, blue: 70/255, alpha: 1),
            UIColor(red: 232/255, green: 218/255, blue: 94/255, alpha: 1),
            UIColor(red: 146/255, green: 181/255, blue: 94/255, alpha: 1),
            UIColor(red: 72/255, green: 125/255, blue: 118/255, alpha: 1)
        ]

        let values = ParticleValues(colors: colors)

        let scene = ParticlesScene(size: view.frame.size, values: values)
        spriteKitView.ignoresSiblingOrder = true
        spriteKitView.presentScene(scene)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
