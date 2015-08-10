//
//  ViewControllerPlaces.swift
//  TravelDestiny
//
//  Created by internet on 7/3/15.
//  Copyright (c) 2015 pinedo. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerPlaces: UITableViewController {
    var myList:Array<AnyObject> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Load...ddd.")
        var id = UIDevice.currentDevice().identifierForVendor.UUIDString
        println(id)
        
        var nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.whiteColor()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        println("Load....")
        // Dispose of any resources that can be recreated.
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let freq = NSFetchRequest (entityName: "Place")
        
        myList = context.executeFetchRequest(freq, error: nil)!
        println("Load....")
        tableView.reloadData()
        
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return myList.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellID: NSString = "Place"
        //var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellID) as UITableViewCell
        
        cell.imageView?.layer.borderWidth = 1.0
        let imageViewSize = 45 as CGFloat
        var data:NSManagedObject = myList[indexPath.row] as NSManagedObject
        cell.textLabel?.text = data.valueForKey("name") as? String
        cell.detailTextLabel?.text = data.valueForKey("location") as? String
        let url = NSURL(string:"http://i.imgur.com/c5fUDQa.jpg")
        //let data1 = NSData(contentsOfURL: url!)
        let data1 = data.valueForKey("photo") as? NSData
        cell.imageView?.frame = CGRectMake(0, 0, 100, 100)
        //cell.imageView?.frame.size.width = imageViewSize
        //cell.imageView?.frame.size.height = imageViewSize
        cell.imageView?.layer.cornerRadius = 10
        cell.imageView?.clipsToBounds = true
        cell.imageView?.image = UIImage(data: data1!)
        return cell
    }
    
    override func prepareForSegue(segue:UIStoryboardSegue, sender:AnyObject?){
        //println("pasa parametros")
        if (segue.identifier == "placeView")
        {   println("placeView")
            var seletedIndex = self.tableView.indexPathForSelectedRow()?.row
            var selectedItem: NSManagedObject = myList[seletedIndex!] as NSManagedObject
            let desti = segue.destinationViewController as PlaceViewController
            desti.currentItem = selectedItem
        }
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let contxt:NSManagedObjectContext = appDel.managedObjectContext!
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
            var deletedItem:NSManagedObject = myList[indexPath.row] as NSManagedObject
            contxt.deleteObject(deletedItem)
            myList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
        contxt.save(nil);
    }
}
