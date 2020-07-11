//
//  PushNotificationManager.swift
//  LocationPush
//
//  Created by Behdad Keynejad on 4/21/1399 AP.
//  Copyright © 1399 AP Behdad Keynejad. All rights reserved.
//

import Foundation
import UserNotifications

class PushNotificationManager {
    class func sendPushNotif(text: String, context: String) {
        
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        
        // MARK: TODO
        // Create a new location manager, set its delegate, start it and get location and show it in the notification body
        content.body = "\(context): \(text)"
        print(content.body)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "\(Date())", content: content, trigger: trigger)
        
        center.add(request) { error in
            guard let error = error else { return }
            print("Adding request to notification service failed with error: \(error)")
        }
    }
}
