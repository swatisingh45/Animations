//
//  MapViewController.swift
//  Animations
//
//  Created by Swati Singh on 18/06/18.
//  Copyright © 2018 Swati Singh. All rights reserved.
//

import UIKit
import  MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lat : CLLocationDegrees = 28.7041
        let lon : CLLocationDegrees = 77.1025
        let lonDelta : CLLocationDegrees = 0.05
        let latDelta : CLLocationDegrees = 0.05
        let span :MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let region : MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        //Finally set up the map
        
        map.setRegion(region, animated: true)

        // Now, we'll set annotations on the map
        
        let annotation = MKPointAnnotation()
        annotation.title = "Your Location"
        annotation.subtitle = "Happy now!"
        // Now set the coordinates
        annotation.coordinate = location
        //Now add a annotation
        map.addAnnotation(annotation)
        
        //Now we'll allow users to add annotation in the map.
        //Colon in longPress makes sure that the information is sent so that we can add the annotaion accordingly
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(MapViewController.longpress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 2
        // After recognizing the press as a gesture, we'll add it to the map
        map.addGestureRecognizer(uilpgr )
        
    
        
    }
    
   
    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
        
        //To be done.
        
        
    }
    
    
    
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
