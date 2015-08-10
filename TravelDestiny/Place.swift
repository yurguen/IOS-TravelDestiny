//
//  Place.swift
//  TravelDestiny
//
//  Created by internet on 7/3/15.
//  Copyright (c) 2015 pinedo. All rights reserved.
//

import UIKit
import CoreData

@objc (Model)
class Place: NSManagedObject {

    @NSManaged var add_name1:String
    @NSManaged var add_name2:String
    @NSManaged var add_name3:String
    @NSManaged var add_name4:String
    @NSManaged var add_photo1:NSData
    @NSManaged var add_photo2:NSData
    @NSManaged var add_photo3:NSData
    @NSManaged var add_photo4:NSData
    @NSManaged var area:String
    @NSManaged var country:String
    @NSManaged var description_place:String
    @NSManaged var height:String
    @NSManaged var id_place:String
    @NSManaged var latitud:String
    @NSManaged var location:String
    @NSManaged var longitud:String
    @NSManaged var name:String
    @NSManaged var official_name:String
    @NSManaged var photo:NSData
}
