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
    
    @IBOutlet weak var activityLabel: UILabel!
    
    
    var activityName: String = ""
    var activityNameArray: [String] = []
    
    var hours = 0
    var minutes = 0
    var seconds = 0
    
    var hourString : String = ""
    var minuteString  : String = ""
    var secondString  : String = ""
       
    var activityDuration: [String] = []
    var startTime: [String] = []
    var stopTime: [String] = []
    var activityDate: [String] = []
       //Timer
    var timer = Timer()
      
    let currentDate = Date()
    let dateFormatter = DateFormatter()
    
    private func disableStopTombol(){
        //stopButtonTombol.setTitleColor(.gray, for: .normal)
        stopStopwatchButton.isUserInteractionEnabled = false
        stopStopwatchButton.setBackgroundImage(#imageLiteral(resourceName: "disable_button"), for: .normal)
        
    }
    
    private func enableStopTombol(){
        stopStopwatchButton.isUserInteractionEnabled = true
        //stopButtonTombol.setTitleColor(.white, for: .normal)
        stopStopwatchButton.setBackgroundImage(#imageLiteral(resourceName: "end_button_2x"), for: .normal)
    }
    
    private func disableStartTombol(){
        startStopwatchButton.isUserInteractionEnabled = false
        //addButtonTombol.setTitleColor(.gray, for: .normal)
        startStopwatchButton.setBackgroundImage(#imageLiteral(resourceName: "disable_button"), for: .normal)
        
    }
    
    private func enableStartTombol(){
        startStopwatchButton.isUserInteractionEnabled = true
        //addButtonTombol.setTitleColor(UIColor.systemBlue, for: .normal)
        startStopwatchButton.setBackgroundImage(#imageLiteral(resourceName: "start_button_2x"), for: .normal)
    }
    

    
    
    @IBAction func startStopwatch(_ sender: UIButton) {
        disableStartTombol()
        enableStopTombol()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(count), userInfo: nil, repeats: true)
        
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        
        var currentStartTime = dateFormatter.string(from: currentDate)
        
        startTime.append(currentStartTime)
        
        UserDefaults.standard.set(startTime, forKey: "startTimeUD")
        

    }
    
    @IBAction func stopStopwatch(_ sender: UIButton) {
    
        disableStopTombol()
        enableStartTombol()
        
    let currentTime = "\(hourString):\(minuteString):\(secondString)"
    activityDuration.append(currentTime)
    timer.invalidate()
    
    (hours, minutes, seconds) = (0, 0, 0)
    hourLabel.text = "00"
    minuteLabel.text = "00"
    secondLabel.text = "00"
        
    dateFormatter.dateStyle = .none
    dateFormatter.timeStyle = .short
    var currentStopTime = dateFormatter.string(from: currentDate)
    
    stopTime.append(currentStopTime)
    
        
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    var currentActivityDate = dateFormatter.string(from: currentDate)
        
    activityDate.append(currentActivityDate)
        
    UserDefaults.standard.set(stopTime, forKey: "stopTimeUD")
    
    UserDefaults.standard.set(activityDuration, forKey: "activityDurationUD")

    UserDefaults.standard.set(activityDate, forKey: "activityDateUD")

    
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
           
        secondString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        secondLabel.text = secondString
        
        minuteString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        minuteLabel.text = minuteString
           
        hourString = hours > 9 ? "\(hours)" : "0\(hours)"
        hourLabel.text = hourString
       }
      
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        disableStopTombol()
        activityLabel.text = "You're on \(activityName) Now"
        activityNameArray.append(activityName)
        
        UserDefaults.standard.set(activityNameArray, forKey: "activityNameArrayUD")
        
    }


}

