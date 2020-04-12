//
//  ViewController.swift
//  WorkyTracky
//
//  Created by Daiva Adisurya on 08/04/20.
//  Copyright © 2020 AppleAcademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlet
    
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
    
    @IBOutlet weak var viewBackground: UIView!
    
    @IBOutlet weak var stopStopwatchButton: UIButton!
    
    @IBOutlet weak var startStopwatchButton: UIButton!
    
    
    
    var hours = 0
    var minutes = 0
    var seconds = 0
       
    var lappedTimes: [String] = []
       //Timer
    var timer = Timer()
      
    
    private func disableStopTombol(){
        //stopButtonTombol.setTitleColor(.gray, for: .normal)
        stopStopwatchButton.isUserInteractionEnabled = false
        stopStopwatchButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
    }
    
    private func enableStopTombol(){
        stopStopwatchButton.isUserInteractionEnabled = true
        //stopButtonTombol.setTitleColor(.white, for: .normal)
        stopStopwatchButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    private func disableStartTombol(){
        startStopwatchButton.isUserInteractionEnabled = false
        //addButtonTombol.setTitleColor(.gray, for: .normal)
        startStopwatchButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
    }
    
    private func enableStartTombol(){
        startStopwatchButton.isUserInteractionEnabled = true
        //addButtonTombol.setTitleColor(UIColor.systemBlue, for: .normal)
        startStopwatchButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    
    @IBAction func startStopwatch(_ sender: UIButton) {
        disableStartTombol()
        enableStopTombol()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(count), userInfo: nil, repeats: true)

    }
    
    @IBAction func stopStopwatch(_ sender: UIButton) {
    
        disableStopTombol()
        enableStartTombol()
        
    let currentTime = "\(hours):\(minutes):\(seconds)"
    lappedTimes.append(currentTime)
    timer.invalidate()
    
    (hours, minutes, seconds) = (0, 0, 0)
    hourLabel.text = "00"
    minuteLabel.text = "00"
    secondLabel.text = "00"

        

    
    }
    
    
    @objc fileprivate func count(){
           seconds += 1
         
           if seconds == 60 {
               minutes += 1
               seconds = 0
           }
           
           if minutes == 60 {
               seconds = 0
               minutes = 0
               hours += 1
           }
           
           if hours == 24 {
               timer.invalidate()
           }
           
           secondLabel.text = seconds > 9 ? "\(seconds)" : "0\(seconds)"
           minuteLabel.text = minutes > 9 ? "\(minutes)" : "0\(minutes)"
           hourLabel.text = hours > 9 ? "\(hours)" : "0\(hours)"
       }
      
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        disableStopTombol()
    }


}

