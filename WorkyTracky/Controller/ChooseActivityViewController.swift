//
//  ChooseActivityViewController.swift
//  WorkyTracky
//
//  Created by Intan Yoshana on 09/04/20.
//  Copyright © 2020 AppleAcademy. All rights reserved.
//

import UIKit

class ChooseActivityViewController: UIViewController {
    
    var manager = NotificationManager()
    
    
    @IBOutlet weak var workButton: UIButton!
    @IBOutlet weak var overtimeButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var breakButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.requestPermission()
  
        navItem.title = "Choose Activity"
//        navItem.title = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        customNavBar()
    }

//    func customNavBar(){
//            // color for large title label
//        self.navItem.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//
//            // color for standard title label
//        self.navItem.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//
//        }
    
    
    @IBAction func cancel(sender: UIBarButtonItem){
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func workPressed(_ sender: UIButton) {
        //select button
        workButton.layer.borderWidth = 3
        workButton.layer.borderColor = #colorLiteral(red: 0.4509803922, green: 0.8274509804, blue: 0.862745098, alpha: 1)
        //unselect button
        unselectBreakLunch()
        overtimeButton.layer.borderWidth = 0
        overtimeButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
        //label activity di stopwatchpage
        let name = sender.currentTitle!
        
        UserDefaults.standard.set(name, forKey: "nameUD")
        
        textLabel.text = name
        // Set Notification
        setNotificationWork()
        
    }
    @IBAction func overtimePressed(_ sender: UIButton) {
        //select button
        overtimeButton.layer.borderWidth = 3
        overtimeButton.layer.borderColor = #colorLiteral(red: 0.4509803922, green: 0.8274509804, blue: 0.862745098, alpha: 1)
         //unselect button
        unselectBreakLunch()
        workButton.layer.borderWidth = 0
        workButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
        //label activity di stopwatchpage
        let name = sender.currentTitle!
        
        UserDefaults.standard.set(name, forKey: "nameUD")
        
        textLabel.text = name
        // Set Notification
        setNotificationWork()
        
    }
    @IBAction func lunchPressed(_ sender: UIButton) {
        //select button
        lunchButton.layer.borderWidth = 3
        lunchButton.layer.borderColor = #colorLiteral(red: 0.4509803922, green: 0.8274509804, blue: 0.862745098, alpha: 1)
        //unselect button
        unselectWorkOvertime()
        breakButton.layer.borderWidth = 0
        breakButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
        //label activity di stopwatchpage
        let name = sender.currentTitle!
        
        UserDefaults.standard.set(name, forKey: "nameUD")
        
        textLabel.text = name
        // Set Notification
        setNotificationLunch()
        
    }
    @IBAction func breakPressed(_ sender: UIButton) {
        //select button
        breakButton.layer.borderWidth = 3
        breakButton.layer.borderColor = #colorLiteral(red: 0.4509803922, green: 0.8274509804, blue: 0.862745098, alpha: 1)
        //unselect button
        unselectWorkOvertime()
        lunchButton.layer.borderWidth = 0
        lunchButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
        //label activity di stopwatchpage
        let name = sender.currentTitle!
        
        UserDefaults.standard.set(name, forKey: "nameUD")
        
        textLabel.text = name
        // Set Notification
        setNotificationBreak()
    }
    @IBAction func startActivityPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toStopwatch", sender: sender)
    }
    
    //function button unselected
    func unselectBreakLunch() {
        breakButton.layer.borderWidth = 0
        breakButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
        lunchButton.layer.borderWidth = 0
        lunchButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
    }
    func unselectWorkOvertime() {
        workButton.layer.borderWidth = 0
        workButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
        overtimeButton.layer.borderWidth = 0
        overtimeButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
    }
    //passing data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationView = segue.destination as?
        ViewController
        destinationView?.activityName = textLabel.text!
    }
    //Notification
    func setNotificationWork() -> Void {
        manager.addNotification(title: "Time to step away from work", body: "Strecth your body, give yourself compliment")
        manager.scheduleNotifications1()
    }
    func setNotificationBreak() -> Void {
        manager.addNotification(title: "Back to Work", body: "Shut social media, switch your phone to on do not disturb")
        manager.scheduleNotifications2()
    }
    func setNotificationLunch() -> Void {
        manager.addNotification(title: "Your lunch is too long", body: "Bill doesn't pay for itself, get back to work")
        manager.scheduleNotifications3()
    }

}

