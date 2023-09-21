

import Foundation
import MapKit
import CoreLocation
import SwiftUI
class directionViewController:UIViewController,CLLocationManagerDelegate{
    var routeCoordinates:[CLLocation]=[]
    var routeOverlay : MKOverlay!
    @IBOutlet weak var mapviewOutlet: MKMapView!
    private let map: MKMapView = {
        let map = MKMapView()
       // map.overrideUserInterfaceStyle = .dark
        return map
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapviewOutlet.delegate=self
        
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        view.addSubview(map);
      //  title="My Location"
        locationClass.shared.getUserLocation{[weak self] location in DispatchQueue.main.async { [self] in
            guard let strongSelf = self else{
                return
            }
            
           // let location2 = CLLocation()
            strongSelf.addMapPinLocation(with: location)
          //  strongSelf.secondMapPinLocation(with: location2)
           
        }
    }
        if(namesTableViewController.num==0){
            mapThis(lat:  34.002669960614064, lan: -118.80694155273044)//pointdume
        }
        if(namesTableViewController.num==1){
            mapThis(lat:  34.04350674582899, lan: -122.40822700)//malibu
        }
        if(namesTableViewController.num==2){
            
            mapThis(lat:  34.039547565463984, lan:-118.5821418913572)//topanga
        }
        if(namesTableViewController.num==3){
           
            mapThis(lat:34.014323025364305, lan: -118.50173215005034)//santa monica
        }
        if(namesTableViewController.num==4){
            mapThis(lat: 33.98172023895696, lan: -118.45814638900595)//marina
        }
        if(namesTableViewController.num==5){
            mapThis(lat: 34.037625783161154, lan: -118.61582284533793)//big rock
        }
        if(namesTableViewController.num==6){
            mapThis(lat:  34.03967956679189, lan: -118.55190039873675)//sunset
        }
        if(namesTableViewController.num==7){
            mapThis(lat: 34.01981670409759, lan: -118.78703341480687)//paradise cove
        }
        if(namesTableViewController.num==8){
            mapThis(lat: 33.99449429153723, lan: -118.48041657148622)//venice
        }
        if(namesTableViewController.num==9){
            mapThis(lat:34.0401276632203, lan: -118.59360850669684)//las tunas
        }
        if(namesTableViewController.num==10){
            mapThis(lat: 34.03584766134699, lan:-118.53582207181985)//will rogers
        }
        if(namesTableViewController.num==11){
            mapThis(lat:  34.04024243863224, lan: -118.57876712203672)//rockey
        }
        if(namesTableViewController.num==12){
            mapThis(lat:   34.04263684321997, lan:-118.56987647601598)//ratner
        }
        if(namesTableViewController.num==13){
            mapThis(lat: 34.0338658745423, lan: -118.68039297432193)//malibu lagoon
        }
        if(namesTableViewController.num==14){
            mapThis(lat:34.03284388652546, lan: -118.74398544482983)//dan blocker
        }
        if(namesTableViewController.num==15){
            mapThis(lat: 33.9805232379387, lan:-118.45825596069860)//mothers
        }
        if(namesTableViewController.num==16){
            mapThis(lat: 34.03373781414708, lan: -118.7330992220391)//corral
        }
        if(namesTableViewController.num==17){
            mapThis(lat: 33.5956710854812, lan: -117.87817376821687)//pirates
        }
        if(namesTableViewController.num==18){
            mapThis(lat:   34.03818476845124, lan: -118.87460937514697)//el matador
        }
        if(namesTableViewController.num==19){
            mapThis(lat:33.91391848864297, lan: -118.42778719423376)//el sugeundo
        }
        
}
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      //  map.frame=view.bounds
        
        
    }
    //this puts a pin in the user's location and displays the user location name on top
    func addMapPinLocation(with location: CLLocation){
        let pin = MKPointAnnotation()
        pin.title="Start"
       // pin.coordinate=CLLocationCoordinate2D(latitude: routeCoordinates[0].coordinate.latitude, longitude: routeCoordinates[0].coordinate.longitude)
        pin.coordinate = location.coordinate
        map.setRegion(MKCoordinateRegion(center: location.coordinate, span:MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        map.addAnnotation(pin);
        
        
        locationClass.shared.resolveLocationName(with: location){
            [weak self] locationName in self?.title = locationName
        }
    }
    func secondMapPinLocation(with location: CLLocation){

    }
    var locationManager = CLLocationManager()
    //get the destination langitude and lantititude
    
    
    @IBOutlet weak var showDistanceOutlet: UILabel!
    @IBOutlet weak var textFieldOutlet: UITextField!
    func mapThis(lat:CLLocationDegrees,lan:CLLocationDegrees){
        let sourceItem2 = CLLocationCoordinate2D(latitude:  34.02252527964094, longitude: -118.28513846011782)
        let desItem2 = CLLocationCoordinate2D(latitude:  lat, longitude: lan)
        createPath(sourceLocation: sourceItem2, destinationLocation: desItem2)
       let myLocation = CLLocation(latitude: 37.78735890, longitude: -122.40822700)
//
        //My buddy's location
        let myBuddysLocation = CLLocation(latitude: lat, longitude: lan)

        //Measuring my distance to my buddy's (in km)
        let distance = myLocation.distance(from: myBuddysLocation) / 1609
        

        //Display the result in km
        showDistanceOutlet.text=String(format:"Distance:  %.01fmiles",distance)
       // print( "The distance to my buddy is %.01", distance)
        
        let location = CLLocation(latitude:lat, longitude: lan)
        let pin = MKPointAnnotation()
        pin.title="Start"
        pin.coordinate = location.coordinate
        map.setRegion(MKCoordinateRegion(center: location.coordinate, span:MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.3)), animated: true)
        map.addAnnotation(pin);
        locationClass.shared.resolveLocationName(with: location){
            [weak self] locationName in self?.title = locationName
        }
    }
   
    
    func createPath(sourceLocation: CLLocationCoordinate2D, destinationLocation:CLLocationCoordinate2D){
        let source = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationItem = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
//        let sourcePlaceMark = MKPlacemark(coordinate:  destinationCord)
//        let destPlaceMark = MKPlacemark(coordinate: destinationCord)
        let sourceItem=MKMapItem(placemark: source)
        let destItem = MKMapItem(placemark: destinationItem)
        
        let sourceAnnotation = MKPointAnnotation()
        let destinationAnnotation=MKPointAnnotation()
        if let location = source.location{
            sourceAnnotation.coordinate=location.coordinate
        }
        if let location = destinationItem.location{
            destinationAnnotation.coordinate = location.coordinate
        }
        self.mapviewOutlet.showAnnotations([sourceAnnotation,destinationAnnotation],animated:true)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceItem
        directionRequest.destination = destItem
        directionRequest.transportType = .automobile
        let dir = MKDirections(request: directionRequest)
        dir.calculate{ ( response, error) in
            guard let response = response else {
            if let error = error {
                print("error \(error.localizedDescription)")
            }
            return
        }
            let route = response.routes[0]
            self.mapviewOutlet.addOverlay(route.polyline, level:MKOverlayLevel.aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.mapviewOutlet.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
}

extension directionViewController : MKMapViewDelegate{
    func mapView(_maoView: MKMapView, rendererFor overlay: MKOverlay)->MKOverlayRenderer{
         let render = MKGradientPolylineRenderer(overlay: overlay)
         render.lineWidth=5
         render.strokeColor = .blue
        print("in create path func")

         return render
        
    }
    
}

