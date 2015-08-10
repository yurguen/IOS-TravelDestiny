//
//  FormPlaceController.swift
//  TravelDestiny
//
//  Created by internet on 7/4/15.
//  Copyright (c) 2015 pinedo. All rights reserved.
//

import UIKit
import CoreData

class FormPlaceController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtArea: UITextField!
    @IBOutlet weak var txtOfficialName: UITextField!
    @IBOutlet weak var txtLatitud: UITextField!
    @IBOutlet weak var txtLongitud: UITextField!
    @IBOutlet weak var txtNameAdd1: UITextField!
    @IBOutlet weak var txtNameAdd2: UITextField!
    @IBOutlet weak var txtNameAdd3: UITextField!
    @IBOutlet weak var txtNameAdd4: UITextField!
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var imageAdd1: UIImageView!
    @IBOutlet weak var imageAdd2: UIImageView!
    @IBOutlet weak var imageAdd3: UIImageView!
    @IBOutlet weak var imageAdd4: UIImageView!
    
    let imagePicker = UIImagePickerController()
    let imagePicker1 = UIImagePickerController()
    let imagePicker2 = UIImagePickerController()
    let imagePicker3 = UIImagePickerController()
    let imagePicker4 = UIImagePickerController()
    var currentItem: NSManagedObject!
    var imageName1: NSData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        println(currentItem)
        if(currentItem != nil){
            txtName.text = currentItem.valueForKey("name") as String
            txtLocation.text = currentItem.valueForKey("location") as String
            txtDescription.text = currentItem.valueForKey("description_place") as String
            txtHeight.text = currentItem.valueForKey("height") as String
            txtArea.text = currentItem.valueForKey("area") as String
            txtOfficialName.text = currentItem.valueForKey("official_name") as String
            txtLatitud.text = currentItem.valueForKey("latitud") as String
            txtLongitud.text = currentItem.valueForKey("longitud") as String
            txtNameAdd1.text = currentItem.valueForKey("add_name1") as String
            txtNameAdd2.text = currentItem.valueForKey("add_name2") as String
            txtNameAdd3.text = currentItem.valueForKey("add_name3") as String
            txtNameAdd4.text = currentItem.valueForKey("add_name4") as String
            imageName1 = currentItem.valueForKey("photo") as NSData
            imageView.image = UIImage(data: imageName1!)
            imageName1 = currentItem.valueForKey("add_photo1") as NSData
            imageAdd1.image = UIImage(data: imageName1!)
            imageName1 = currentItem.valueForKey("add_photo1") as NSData
            imageAdd2.image = UIImage(data: imageName1!)
            imageName1 = currentItem.valueForKey("add_photo3") as NSData
            imageAdd3.image = UIImage(data: imageName1!)
            imageName1 = currentItem.valueForKey("add_photo4") as NSData
            imageAdd4.image = UIImage(data: imageName1!)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionSave(sender: AnyObject) {
        println("Save")
        // Reference to our app delegate
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let contxt:NSManagedObjectContext = appDel.managedObjectContext!
        
        let en = NSEntityDescription.entityForName("Place", inManagedObjectContext: contxt)
        if (currentItem != nil){
            currentItem.setValue(txtName.text, forKey: "name");
            currentItem.setValue(txtLocation.text, forKey: "location");
            currentItem.setValue(txtDescription.text, forKey: "description_place");
            currentItem.setValue(txtHeight.text, forKey: "height");
            currentItem.setValue(txtArea.text, forKey: "area");
            currentItem.setValue(txtOfficialName.text, forKey: "official_name");
            currentItem.setValue(txtLatitud.text, forKey: "latitud");
            currentItem.setValue(txtLongitud.text, forKey: "longitud");
            currentItem.setValue(txtNameAdd1.text, forKey: "add_name1");
            currentItem.setValue(txtNameAdd2.text, forKey: "add_name2");
            currentItem.setValue(txtNameAdd3.text, forKey: "add_name3");
            currentItem.setValue(txtNameAdd4.text, forKey: "add_name4");
            let imageData = UIImageJPEGRepresentation(imageView.image,100)
            currentItem.setValue(imageData, forKey: "photo")
            let imageData1 = UIImageJPEGRepresentation(imageAdd1.image,100)
            currentItem.setValue(imageData1, forKey: "add_photo1")
            let imageData2 = UIImageJPEGRepresentation(imageAdd2.image,100)
            currentItem.setValue(imageData2, forKey: "add_photo2")
            let imageData3 = UIImageJPEGRepresentation(imageAdd3.image,100)
            currentItem.setValue(imageData3, forKey: "add_photo3")
            let imageData4 = UIImageJPEGRepresentation(imageAdd4.image,100)
            currentItem.setValue(imageData4, forKey: "add_photo4")
        } else {
            var newItem = Place(entity:en!, insertIntoManagedObjectContext:contxt)
            newItem.name = txtName.text
            newItem.location = txtLocation.text
            newItem.description_place = txtDescription.text
            newItem.height = txtHeight.text
            newItem.area = txtArea.text
            newItem.official_name = txtOfficialName.text
            newItem.latitud = txtLatitud.text
            newItem.longitud = txtLongitud.text
            newItem.add_name1 = txtNameAdd1.text
            newItem.add_name2 = txtNameAdd2.text
            newItem.add_name3 = txtNameAdd3.text
            newItem.add_name4 = txtNameAdd4.text
            let imageData = UIImageJPEGRepresentation(imageView.image,100)
            newItem.photo = imageData
            let imageData1 = UIImageJPEGRepresentation(imageAdd1.image,100)
            newItem.add_photo1 = imageData1
            let imageData2 = UIImageJPEGRepresentation(imageAdd2.image,100)
            newItem.add_photo2 = imageData2
            let imageData3 = UIImageJPEGRepresentation(imageAdd3.image,100)
            newItem.add_photo3 = imageData3
            let imageData4 = UIImageJPEGRepresentation(imageAdd4.image,100)
            newItem.add_photo4 = imageData4
            println(newItem)
        }
        
        contxt.save(nil)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func actionCancel(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            if imageView.image == nil
            {
                imageView.contentMode = .ScaleAspectFit
                imageView.image = pickedImage
            }
            else
            {
                if imageAdd1.image == nil
                {
                    imageAdd1.contentMode = .ScaleAspectFit
                    imageAdd1.image = pickedImage
                }
                else
                {
                    if imageAdd2.image == nil
                    {
                        imageAdd2.contentMode = .ScaleAspectFit
                        imageAdd2.image = pickedImage
                    }
                    else
                    {
                        if imageAdd3.image == nil
                        {
                            imageAdd3.contentMode = .ScaleAspectFit
                            imageAdd3.image = pickedImage
                        }
                        else
                        {
                            if imageAdd4.image == nil
                            {
                                imageAdd4.contentMode = .ScaleAspectFit
                                imageAdd4.image = pickedImage
                            }
                            else
                            {
                                imageAdd4.contentMode = .ScaleAspectFit
                                imageAdd4.image = pickedImage
                            }
                        }
                    }
                }
            }
            
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func actionLoadImage(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
}
