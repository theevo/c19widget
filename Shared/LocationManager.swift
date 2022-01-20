//
//  LocationManager.swift
//  c19widget
//
//  Created by Theo Vora on 1/6/22.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, LocationManagable {
    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    
    @Published var currentPlacemark: Placemarkable?
    var currentPlacemarkPublished: Published<Placemarkable?> { _currentPlacemark }
    var currentPlacemarkPublisher: Published<Placemarkable?>.Publisher { $currentPlacemark }
        
    var userDidAuthorize: Bool {
        switch locationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            return true
        default:
            return false
        }
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer // saves battery!
        locationStatus = locationManager.authorizationStatus
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
    
    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func getLocation() {
        
        
//        if userDidAuthorize {
//            print(#function, "updating location")
            locationManager.startUpdatingLocation()
//        } else {
//            print(#function, "request Auth")
//            requestAuthorization()
//        }
    }
}
    
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationStatus = manager.authorizationStatus
        
        switch locationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            getLocation()
            break
        case .notDetermined:
            requestAuthorization()
            break
        default:
            break
        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        locationStatus = status
//        print(#function, statusString)
//    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        Task {
            currentPlacemark = await location.getPlacemark()
        }
        
        locationManager.stopUpdatingLocation()
    }
}

extension CLLocation {
    func getPlacemark() async -> CLPlacemark? {
        do {
            let placemarks = try await CLGeocoder().reverseGeocodeLocation(self)
                       
            guard let placemark = placemarks.first else { return nil }
            
            return placemark
        } catch let error {
            print("Error: reverseGeocodeLocation failed:", error)
            return nil
        }
    }
}

extension CLLocationCoordinate2D: CustomStringConvertible {
    public var description: String {
        "(\(self.latitude), \(self.longitude))"
    }
}
