//
//  ViewController.swift
//  EggTimer
//
//  Created by William Daly on 03/03/2023.
//

import UIKit

class ViewController: UIViewController {
 
    
    @IBOutlet weak var isRaw: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        isRaw.isOn = false
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
        @objc func updateTimer() {
            if secondsPassed < totalTime {
                secondsPassed += 1
                progressBar.progress = Float(secondsPassed) / Float(totalTime)
            } else {
                timer.invalidate()
                titleLabel.text = "Done!"
            }
            
            if isRaw.isOn
            {
                eggTimes = ["Soft": 0, "Medium": 0, "Hard": 0]
            }
            else
            {
                eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
            }
        }
    }

