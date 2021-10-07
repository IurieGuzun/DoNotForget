//
//  UNservice.swift
//  DoNotForget
//
//  Created by Iurie Guzun on 2021-10-06.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import Foundation

import UserNotifications

class UNService: NSObject {
    private override init() {}
    static let shared = UNService()
   
    let unCenter = UNUserNotificationCenter.current()
    
    func authorize() {
        let options: UNAuthorizationOptions = [.alert,.badge,.sound,.carPlay]
        unCenter.requestAuthorization(options: options) { granted, error in
            print(error ?? "No UN auth error")
            guard granted else {
                print("User Denied Access")
                return
            }
            self.configure()
        }
    }
    
    func configure() {
        unCenter.delegate = self
    }
    
    func timeRequest(with interval: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = "Timer Finished!"
        content.body = "Your timer is all done! That's IT!"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
        let request = UNNotificationRequest(identifier: "userNotification.timer", content: content, trigger: trigger)
        unCenter.add(request)
    }
    func dateRequest(with components: DateComponents) {
        let content = UNMutableNotificationContent()
        content.title = "Date Trigger!"
        content.body = "It is now the future!"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        let request = UNNotificationRequest(identifier: "userNotification.date", content: content, trigger: trigger)
        unCenter.add(request)

    }
    func locationRequest(with interval: TimeInterval) {
        
    }

    
    
}
 


extension UNService: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("UN did receive responce")
        
        completionHandler()
    
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("UN will present!")
        
        let options: UNNotificationPresentationOptions = [.alert, .sound]
        completionHandler(options)
    }
}

