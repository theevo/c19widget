//
//  LocationManager.swift
//  c19widget
//
//  Created by Theo Vora on 1/6/22.
//

import Foundation
import CoreLocation
//import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: String = ""
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined:
            return "notDetermined" // user has not set
        case .authorizedWhenInUse, .authorizedAlways:
            return "authorized"
        case .restricted:
            return "restricted"
        case .denied:
            return "denied"
        default:
            return "unknown"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location.coordinate.description
        print(#function, location)
        locationManager.stopUpdatingLocation()
    }
}

extension CLLocationCoordinate2D: CustomStringConvertible {
    public var description: String {
        "(\(self.latitude), \(self.longitude))"
    }
}
