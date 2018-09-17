//
//  LocalPushManager.swift
//  FitnessCoach
//
//  Created by Kevin Li on 7/5/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UserNotifications

class LocalPushManager:NSObject {
    static var sharedNotification = LocalPushManager()
    
    let center = UNUserNotificationCenter.current()
    
    func requestNotification(){
        center.requestAuthorization(options: [.alert,.sound]) {(granted,error) in
            if !granted{
                print("Permission Granted")
            }
            else{
                let content = UNMutableNotificationContent()
                content.title = "Don't Forget"
                content.body = "Try to get to your goal today!"
                content.sound = UNNotificationSound.default()
                var date = DateComponents()
                date.hour = 11
                let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
                let identifier = "UYLLocalNotification"
                let request = UNNotificationRequest(identifier: identifier,
                                                    content: content, trigger: trigger)
                self.center.add(request, withCompletionHandler: { (error) in
                    if error != nil {
                        // Something went wrong
                    }
                })
            }
        }
    }
    /*
    let triggerDaily = Calendar.current.dateComponents([hour,.minute,.second,], from: date)
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
     */
    
}
