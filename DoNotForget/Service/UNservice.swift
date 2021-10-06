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

