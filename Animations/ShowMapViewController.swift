//
//  ShowMapViewController.swift
//  Animations
//
//  Created by Swati Singh on 19/06/18.
//  Copyright © 2018 Swati Singh. All rights reserved.
//

import UIKit
import MapKit
class ShowMapViewController: UIViewController , MKMapViewDelegate{
    
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ShowMapViewController.longpress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        
        
        if activePlaces != -1 {
            // Get the place details to show on the map
            if places.count > activePlaces{
                
                if let name = places[activePlaces]["name"] {
                    
                    if let lat = places[activePlaces]["lat"] {
                        
                        if let lon = places[activePlaces]["lon"] {
                           
                            if let latitude = Double(lat) {
                            
                                if let longitude = Double(lon) {
                                    
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    let region = MKCoordinateRegion(center: coordinate, span: span)
                                    self.map.setRegion(region, animated: true )
                                    let annotation = MKPointAnnotation()
                                    annotation.coordinate = coordinate
                                    annotation.title = name
                                    self.map.addAnnotation(annotation)
                                    
                                }
                            }
                        }
                    }
                }
            }

        }
  // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func longpress(gestureRecognizer : UIGestureRecognizer){
        
        if gestureRecognizer.state == UIGestureRecognizerState.began {
       
           let touchPoint = gestureRecognizer.location(in: self.map)
           let newCoordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
            let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
          
            var title = " "
            
            CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
                
                if error != nil {
                    
                    print(error)
                } else {
                    
                    if let placemark = placemarks?[0] {
                        if placemark.subThoroughfare != nil {
                            
                            title += placemark.subThoroughfare! + " "
                        }
                        
                        if placemark.thoroughfare != nil {
                            
                            title += placemark.thoroughfare!
                            
                        }
                    }
                }
                
                if title == " " {
                    
                    title = "Added \(NSData())"
                }
                let annotation = MKPointAnnotation()
                annotation.coordinate = newCoordinate
                annotation.title = title
                
                self.map.addAnnotation(annotation)
                places.append(["name" : title, "lat" : String(newCoordinate.latitude), "lon" : String(newCoordinate.longitude)])
                print(places)
            
            
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
