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

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = ParticlesScene(size: view.frame.size)
        let skView = view as! SKView
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
