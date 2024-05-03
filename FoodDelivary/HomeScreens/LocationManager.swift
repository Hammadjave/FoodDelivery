//
//  LocationManager.swift
//  FoodDelivary
//
//  Created by Chohan on 24/02/2024.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    @Published var locationManager = CLLocationManager()
    @Published var userLocation : CLLocation! 
    @Published var userAddress = ""

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case.authorizedWhenInUse :
            print("authorized")
            manager.requestLocation()
        case.denied:
            print("Denied")
        default:
            print("UnKnown")
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.userLocation = locations.last
        self.extractLocation()
    }
    
    
    func extractLocation() {
        CLGeocoder().reverseGeocodeLocation(self.userLocation) { (res, err) in
            guard let safeData  = res else{return}
            var address = ""
            
            address += safeData.first?.name ?? ""
            address += ", "
            address += safeData.first?.locality ?? ""
            
            self.userAddress = address
        }
    }

}

