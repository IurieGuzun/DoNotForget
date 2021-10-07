//
//  CLService.swift
//  DoNotForget
//
//  Created by Iurie Guzun on 2021-10-07.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import Foundation
import CoreLocation

class CLService: NSObject {
    private override init() {}
    static let shared = CLService()
    
    let locationManager = CLLocationManager()
    
    func authorize() {
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
    }
    func updateLocation() {
        locationManager.startUpdatingLocation()
    }
    
}

extension CLService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Got location!")
    }
}
