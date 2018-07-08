//
//  ViewController.swift
//  StopWatch
//
//  Created by Arya Atighehchian on 7/4/18.
//  Copyright © 2018 Arya Atighehchian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0
    var timeDisplay = "00:00.00"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.layer.borderWidth = 3
        timeLabel.layer.borderColor = UIColor.magenta.cgColor
        timeLabel.layer.cornerRadius = 5.0
        
        
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        stopButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        resetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        startButton.layer.borderColor = UIColor.magenta.cgColor
        startButton.layer.borderWidth = 3.0
        startButton.layer.cornerRadius = 5.0
        
        stopButton.layer.borderColor = UIColor.magenta.cgColor
        stopButton.layer.borderWidth = 3.0
        stopButton.layer.cornerRadius = 5.0
        
        resetButton.layer.borderColor = UIColor.magenta.cgColor
        resetButton.layer.borderWidth = 3.0
        resetButton.layer.cornerRadius = 5.0
        
        stopButton.isEnabled = false
        resetButton.isEnabled = false
    }

    @IBAction func start(_ sender: Any) {
        startTime = Date().timeIntervalSinceReferenceDate
        timer = Timer.scheduledTimer(timeInterval: 0.05,
                                     target: self,
                                     selector: #selector(advanceTimer(timer:)),
                                     userInfo: nil,
                                     repeats: true)
        startButton.isEnabled = false
        stopButton.isEnabled = true
    }
    @objc func advanceTimer(timer: Timer) {
        
        //Total time since timer started, in seconds
        time = Date().timeIntervalSinceReferenceDate - startTime
        
        
        //Convert the time to a string with 2 decimal places
        let timeString = String(format: "%.2f", time)
        
        //Display the time string to a label in our view controller
        timeLabel.text = timeString
    }
    @IBAction func stop(_ sender: Any) {
        timer?.invalidate()
        stopButton.isEnabled = false
        resetButton.isEnabled = true
    }
    
    @IBAction func reset(_ sender: Any) {
        time = 0
        startTime = 0
        timeLabel.text = timeDisplay
        startButton.isEnabled = true
        stopButton.isEnabled = false
        resetButton.isEnabled = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

