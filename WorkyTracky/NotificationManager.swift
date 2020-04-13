//
//  NotificationManager.swift
//  MC1-Notification
//
//  Created by Rafika Alifia Isti on 11/04/20.
//  Copyright © 2020 Rafika Alifia Isti. All rights reserved.
//

import UserNotifications

struct Notification {
    var id: String
    var title: String
    var body: String
}

class NotificationManager {
    
    var notifications = [Notification]()
    
    func schedule() -> Void {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestPermission()
            case .authorized, .provisional:
                self.scheduleNotifications1()
                self.scheduleNotifications2()
                self.scheduleNotifications3()
            default:
                break
            }
        }
    }

    
    //buat munculin request permission ke user pas pertama kali app di download
       func requestPermission() -> Void {
           UNUserNotificationCenter
               .current()
               .requestAuthorization(options: [.alert, .badge, .alert]) { granted, error in
                   if granted == true && error == nil {
                   }
           }
       }
    
    //method to add notifications
    func addNotification(title: String, body: String) -> Void {
        notifications.append(Notification(id: UUID().uuidString, title: title, body: body))
    }
    
    //scheduled the notification
       func scheduleNotifications1() -> Void {
           for notification in notifications {
               
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.body = notification.body
            
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10 , repeats: false)
            
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
               
               UNUserNotificationCenter.current().add(request) { error in
                   guard error == nil else { return }
                   print("Scheduling notification with id: \(notification.id)")
               }
           }
       }
    
    func scheduleNotifications2() -> Void {
        for notification in notifications {
            
         let content = UNMutableNotificationContent()
         content.title = notification.title
         content.body = notification.body
         
         
         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20 , repeats: false)
         
         let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }
                print("Scheduling notification with id: \(notification.id)")
            }
        }
    }
    
    func scheduleNotifications3() -> Void {
        for notification in notifications {
            
         let content = UNMutableNotificationContent()
         content.title = notification.title
         content.body = notification.body
         
         
         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30 , repeats: false)
         
         let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }
                print("Scheduling notification with id: \(notification.id)")
            }
        }
    }
}


