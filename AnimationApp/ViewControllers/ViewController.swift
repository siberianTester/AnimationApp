//
//  ViewController.swift
//  AnimationApp
//
//  Created by Yaroslav Malygin on 18.11.2024.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    @IBOutlet var animationView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    private var isFirstRun = true
    private var currentPreset = ""
    private var nextPreset = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentPreset = getRandomPreset()
        nextPreset = getRandomPreset()
        
        setAnimationLabels()
    }
    
    @IBAction func runAnimation(_ sender: SpringButton) {
        animationView.animation = isFirstRun ? currentPreset : nextPreset
        animationView.curve = curveLabel.text ?? "easeIn"
        animationView.force = Double(forceLabel.text ?? "1.0") ?? 1.0
        animationView.duration = Double(durationLabel.text ?? "1.0") ?? 1.0
        animationView.delay = Double(delayLabel.text ?? "0.0") ?? 0.0
        animationView.animate()
        
        if !isFirstRun {
            currentPreset = nextPreset
            setAnimationLabels()
        }
        
        nextPreset = getRandomPreset()
        sender.setTitle("Run \(nextPreset)", for: .normal)
        
        isFirstRun = false
    }
    
    private func getRandomPreset() -> String {
        AnimationPreset.allCases.randomElement()?.rawValue ?? "pop"
    }
    
    private func getRandomCurve() -> String {
        AnimationCurve.allCases.randomElement()?.rawValue ?? "easeIn"
    }
    
    private func setAnimationLabels() {
        presetLabel.text = currentPreset
        curveLabel.text = getRandomCurve()
        forceLabel.text = String(format: "%.2f", Double.random(in: 1...4))
        durationLabel.text = String(format: "%.2f", Double.random(in: 0.5...4))
        delayLabel.text = String(format: "%.2f", Double.random(in: 0...2))
    }
}

