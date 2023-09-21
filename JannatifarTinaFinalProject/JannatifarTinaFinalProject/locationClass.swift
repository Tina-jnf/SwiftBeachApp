//
//  locationClass.swift
//  JannatifarTinaFinalProject
//
//  Created by mahta 96 on 12/5/22.
//

import Foundation
import CoreLocation
class locationClass : NSObject,CLLocationManagerDelegate{
    
 
    
    static let shared = locationClass()
    
    let manager = CLLocationManager()
    var completion : ((CLLocation) -> Void)?
    public func getUserLocation(completion : @escaping ((CLLocation)-> Void)){
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    public func getDesLocation(completion : @escaping ((CLLocation)->Void)){
        self.completion = completion
        self.locationManager(manager, didUpdateLocations: ([CLLocation(latitude:  34.040298085257035, longitude: -118.65745843511208)]))
    }
    public func resolveLocationName(with location: CLLocation, completion:@escaping(String?)->Void){
        let geocoder=CLGeocoder()
        geocoder.reverseGeocodeLocation(location,preferredLocale:  .current){
            placemarks, error in
            guard let place = placemarks?.first, error == nil else{
                completion(nil)
                return
            }
            print(place)
            var name = ""
            if let locality=place.locality{
                name+=locality
            }
            if let adminRegion=place.administrativeArea{
                name += ", \(adminRegion)"
            }
            completion(name)
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let location = locations.first else {
            return
        }
        //this will stop the updating after we don't need it anymore
        completion?(location)
        manager.stopUpdatingLocation()
        
    }
    
    
}
