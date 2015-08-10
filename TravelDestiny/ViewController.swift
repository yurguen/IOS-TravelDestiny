//
//  ViewController.swift
//  TravelDestiny
//
//  Created by internet on 7/3/15.
//  Copyright (c) 2015 pinedo. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var mapView1: MKMapView!
    var currentItem: NSManagedObject!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var lat : CLLocationDegrees = -17.3786923
        var long : CLLocationDegrees = -66.180398
        var sname:String = "Title"
        var slocation:String = "Subtitle"
        
        if(currentItem != nil){
            
            var slat:Double = (currentItem.valueForKey("latitud") as NSString).doubleValue
            var slong:Double = (currentItem.valueForKey("longitud") as NSString).doubleValue
            sname = currentItem.valueForKey("name") as String
            slocation = currentItem.valueForKey("location") as String
            lat = slat
            long = slong
            
        }
        
        //let location = CLLocationCoordinate2D(latitude:-17.3786923, longitude:-66.180398)
        let location = CLLocationCoordinate2D(latitude:lat, longitude:long)
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView1.setRegion(region, animated: true)
        let anotation = MKPointAnnotation()
        anotation.setCoordinate(location)
        anotation.title = sname
        anotation.subtitle = sname
        mapView1.addAnnotation(anotation)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

