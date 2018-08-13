//
//  FindingUserLocationViewController.swift
//  Animations
//
//  Created by Swati Singh on 18/06/18.
//  Copyright © 2018 Swati Singh. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class FindingUserLocationViewController: UIViewController , CLLocationManagerDelegate, MKMapViewDelegate{
    
    // We need a manager to manage the location
    
    
    @IBOutlet var latitudeLabel: UILabel!
    
    @IBOutlet var longitudeLabel: UILabel!
    
    @IBOutlet var courseLabel: UILabel!
    
    
    @IBOutlet var speedLabel: UILabel!
    
    @IBOutlet var altitudeLabel: UILabel!
    
    
    @IBOutlet var addressLabel: UILabel!
    
    
    
    var locationManager =  CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.stopUpdatingLocation()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Write the code for extracting user's location .
        let userLocation : CLLocation = locations[0]
        //    let lat = userLocation.coordinate.latitude
        //   let lon = userLocation.coordinate.longitude
        //  let latDelta : CLLocationDegrees = 0.05
        // let lonDelta : CLLocationDegrees = 0.05
        //   let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
      //   let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        //    let region = MKCoordinateRegion(center: location, span: span)
        // map is acutally the label "map" that sets the location on the map.
        //   self.map.setRegion(region, animated : true)
        
        self.latitudeLabel.text = String(userLocation.coordinate.latitude)
        self.longitudeLabel.text =  String(userLocation.coordinate.longitude)
        self.courseLabel.text = String(userLocation.course)
        self.speedLabel.text = String(userLocation.speed)
        self.altitudeLabel.text = String(userLocation.altitude)
         
        
        
        
        // CLPlacemark is a way of storing the address details
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print(error)
                
            } else {
                
                
                if let placemark = placemarks?[0] {
                    
                   var subThoroughFare = ""
                    if placemark.subThoroughfare != nil {
                        
                        subThoroughFare = placemark.subThoroughfare!
                    }
                    
                    var thoroughFare = ""
                    if placemark.thoroughfare != nil {
                        
                        subThoroughFare = placemark.thoroughfare!
                    }
                    
                    print(  subThoroughFare + "\n" + thoroughFare)
                    
                    
                }
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
