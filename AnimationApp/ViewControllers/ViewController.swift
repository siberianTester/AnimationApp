//
//  ViewController.swift
//  AnimationApp
//
//  Created by Yaroslav Malygin on 18.11.2024.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var animationView: SpringView!
    @IBOutlet var animationLabel: SpringLabel! {
        didSet {
            animationLabel.text = animation.description
        }
    }
    
    // MARK: - Private properties
    private var animation = Animation.randomAnimation
    
    // MARK: - IB Actions
    @IBAction func runAnimation(_ sender: UIButton) {
        animationLabel.text = animation.description
        
        animationView.animation = animation.name
        animationView.curve = animation.curve
        animationView.duration = animation.duration
        animationView.force = animation.force
        animationView.delay = animation.delay
        animationView.animate()
        
        animation = Animation.randomAnimation
        sender.setTitle("Run \(animation.name)", for: .normal)
    }
}

