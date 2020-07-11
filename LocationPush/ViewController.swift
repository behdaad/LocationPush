//
//  ViewController.swift
//  LocationPush
//
//  Created by Behdad Keynejad on 4/21/1399 AP.
//  Copyright © 1399 AP Behdad Keynejad. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications

class ViewController: UIViewController {
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
//        let locationManager2 = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        PushNotificationManager.sendPushNotif(text: "\(Date())", context: "VC")
    }
}
