//
//  DetailActivityViewController.swift
//  WorkyTracky
//
//  Created by Rafika Alifia Isti on 13/04/20.
//  Copyright © 2020 AppleAcademy. All rights reserved.
//

import UIKit

class DetailActivityViewController: UIViewController {

// outlet
    
    @IBOutlet weak var activityDurationLabel: UILabel!
    
    @IBOutlet weak var startTimeLabel: UILabel!
    
    @IBOutlet weak var endTimeLabel: UILabel!
    
    @IBOutlet weak var activityNameLabel: UILabel!
    
    @IBOutlet weak var activityDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var activityDuration = UserDefaults.standard.object(forKey: "activityDurationUD") as? [String] ?? [String]()
        
        var startTime = UserDefaults.standard.object(forKey: "startTimeUD") as? [String] ?? [String]()
        
        var stopTime = UserDefaults.standard.object(forKey: "stopTimeUD") as? [String] ?? [String]()
        
        var activityNameArray = UserDefaults.standard.object(forKey: "activityNameArrayUD") as? [String] ?? [String]()
        
        var activityDate = UserDefaults.standard.object(forKey: "activityDateUD") as? [String] ?? [String]()
        
        activityDurationLabel.text = activityDuration.last
        startTimeLabel.text = startTime.last
        endTimeLabel.text = stopTime.last
        activityNameLabel.text = activityNameArray.last
        activityDateLabel.text = activityDate.last
        }

        // Do any additional setup after loading the view.
    
    
        
    
    
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


