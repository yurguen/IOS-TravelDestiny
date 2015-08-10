//
//  PageContentViewController.swift
//  TravelDestiny
//
//  Created by internet on 7/8/15.
//  Copyright (c) 2015 pinedo. All rights reserved.
//

import UIKit
import CoreData

class PageContentViewController: UIViewController {

    @IBOutlet weak var imageViewImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    // MARK: - Variables
    var itemIndex: Int = 0
    var name: String = ""
    var imageName: String = "" {
        
        didSet {
            
            if let imageView = imageViewImage {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    var imageName1: NSData? = nil
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageViewImage!.image = UIImage(named: imageName)
        imageViewImage.image = UIImage(data: imageName1!)
        labelName.text = name
        
    }

}
