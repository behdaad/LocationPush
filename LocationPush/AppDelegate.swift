//
//  AppDelegate.swift
//  LocationPush
//
//  Created by Behdad Keynejad on 4/21/1399 AP.
//  Copyright © 1399 AP Behdad Keynejad. All rights reserved.
//

import UIKit
import UserNotifications
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        PushNotificationManager.sendPushNotif(text: "did finish launching", context: "AD")
        
        
        let center =  UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (result, error) in
           //handle result of request failure
            
            if result {
                print("Got authorized")
            } else {
                if let error = error {
                    print("error requesting authorization for push: \(error.localizedDescription)")
                }
            }
        }
        
        print(launchOptions ?? "launch options is nil")
        
        if let launchOptions = launchOptions {
            if launchOptions[UIApplication.LaunchOptionsKey.location] != nil {
                PushNotificationManager.sendPushNotif(text: "\(Date())", context: "AD")
            }
        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        PushNotificationManager.sendPushNotif(text: "will resign active", context: "AD")
    }
}
