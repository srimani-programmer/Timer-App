//
//  ViewController.swift
//  Timer
//
//  Created by sri manikanta on 14/03/19.
//  Copyright © 2019 sri manikanta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time = 0.0  // time value
    var isRunning = false
    var timer = Timer()
    
    
    @IBOutlet var outputLabel: UILabel!
    
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var pauseButton: UIButton!
    
    @IBOutlet var resetButton: UIButton!
    
    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timeUpdate), userInfo: nil, repeats: true)
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        resetButton.isEnabled = true
        isRunning = true
    }
    
    @IBAction func pause(_ sender: UIButton) {
        timer.invalidate()
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        resetButton.isEnabled = true
        isRunning = false
    }
    
    
    @IBAction func reset(_ sender: UIButton) {
        time = 0.0
        outputLabel.text = "0.0"
        timer.invalidate()
        resetButton.isEnabled = true
        startButton.isEnabled = true
        pauseButton.isEnabled = true
        isRunning = true
    }
    
    @objc func timeUpdate(){
        time += 0.1
        outputLabel.text = String(format: "%.1f", time)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = "\(time)"
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        resetButton.isEnabled = false
    }


}

