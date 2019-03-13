//
//  ViewController.swift
//  Timer
//
//  Created by sri manikanta on 13/03/19.
//  Copyright © 2019 sri manikanta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time = 0.0
    var timer = Timer()
    var isRunningTimer = false
    
    @IBOutlet weak var outputlabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timeUpdate), userInfo: nil, repeats: true)
            startButton.isEnabled = false
            pauseButton.isEnabled = true
            resetButton.isEnabled = true
            isRunningTimer = true
    }
    
    @IBAction func pause(_ sender: UIButton) {
        timer.invalidate()
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        resetButton.isEnabled = true
        isRunningTimer = false
    }
    
    @IBAction func reset(_ sender: UIButton) {
        time = 0.0
        outputlabel.text = "0.0"
        timer.invalidate()
        resetButton.isEnabled = true
        startButton.isEnabled = true
        pauseButton.isEnabled = true
        isRunningTimer = true
    }

   @objc func timeUpdate(){
        time += 0.1
        outputlabel.text = String(format: "%.1f", time)    // Formated the string
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        outputlabel.text = "\(time)"
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        resetButton.isEnabled = false
    }


}

