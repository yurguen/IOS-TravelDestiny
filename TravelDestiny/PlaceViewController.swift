//
//  PlaceViewController.swift
//  TravelDestiny
//
//  Created by internet on 7/9/15.
//  Copyright (c) 2015 pinedo. All rights reserved.
//

import UIKit
import CoreData

class PlaceViewController: UIViewController {
    var currentItem: NSManagedObject!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var labelArea: UILabel!
    @IBOutlet weak var labelOffcialName: UILabel!
    @IBOutlet weak var labelLatitud: UILabel!
    @IBOutlet weak var labelLongitud: UILabel!
    
    @IBOutlet weak var buttonImage: UIButton!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if(currentItem != nil){
            let data1 = currentItem.valueForKey("photo") as NSData
            imageView.image = UIImage(data: data1)
            navigationBar.title = currentItem.valueForKey("name") as String
            labelLocation.text = currentItem.valueForKey("location") as String
            labelDescription.text = currentItem.valueForKey("description_place") as String
            labelHeight.text = currentItem.valueForKey("height") as String
            labelArea.text = currentItem.valueForKey("area") as String
            labelOffcialName.text = currentItem.valueForKey("official_name") as String
            labelLatitud.text = currentItem.valueForKey("latitud") as String
            labelLongitud.text = currentItem.valueForKey("longitud") as String
        }
    }
    override func prepareForSegue(segue:UIStoryboardSegue, sender:AnyObject?){
        //println("pasa parametros")
        if (segue.identifier == "editPlace")
        {   println("editPlace")
            let desti = segue.destinationViewController as FormPlaceController
            desti.currentItem = self.currentItem
        }
        if (segue.identifier == "placeDetail")
        {   println("placeDetail")
            let desti = segue.destinationViewController as PlaceController
            desti.currentItem = self.currentItem
        }
        if (segue.identifier == "viewMap")
        {   println("viewMap")
            let desti = segue.destinationViewController as ViewController
            desti.currentItem = self.currentItem
        }
        
    }

    
}
