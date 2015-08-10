//
//  PlaceController.swift
//  TravelDestiny
//
//  Created by internet on 7/8/15.
//  Copyright (c) 2015 pinedo. All rights reserved.
//

import UIKit
import CoreData

class PlaceController: UIViewController ,UIPageViewControllerDataSource {
    // MARK: - Variables
    private var pageViewController: UIPageViewController?
    var currentItem: NSManagedObject!
    // Initialize it right away here
    private let contentImages = ["nature_pic_1.png",
        "nature_pic_2.png",
        "nature_pic_3.png",
        "nature_pic_4.png"];
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sName:String = ""
        var sLocation:String = ""
        var sDescription:String = ""
        var sHeight:String = ""
        var sArea:String = ""
        var sOfficialName:String = ""
        var sLatitud:String = ""
        var sLongitud:String = ""
        
        if(currentItem != nil){
            sName = currentItem.valueForKey("name") as String
            sLocation = currentItem.valueForKey("location") as String
            sDescription = currentItem.valueForKey("description_place") as String
            sHeight = currentItem.valueForKey("height") as String
            sArea = currentItem.valueForKey("area") as String
            sOfficialName = currentItem.valueForKey("official_name") as String
            sLatitud = currentItem.valueForKey("latitud") as String
            sLongitud = currentItem.valueForKey("longitud") as String
        }
        createPageViewController()
        setupPageControl()
    }
    
    private func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageController") as UIPageViewController
        pageController.dataSource = self
        
        if contentImages.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers: NSArray = [firstController]
            pageController.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor.darkGrayColor()
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as PageContentViewController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex-1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as PageContentViewController
        
        if itemController.itemIndex+1 < contentImages.count {
            return getItemController(itemController.itemIndex+1)
        }
        
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> PageContentViewController? {
        
        if itemIndex < contentImages.count {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("PageContentController") as PageContentViewController
            pageItemController.itemIndex = itemIndex
            
            if(currentItem != nil){
                if itemIndex == 0 {
                    pageItemController.imageName1 = currentItem.valueForKey("add_photo1") as? NSData
                    pageItemController.name = currentItem.valueForKey("add_name1") as String
                }
                if itemIndex == 1 {
                    pageItemController.imageName1 = currentItem.valueForKey("add_photo2") as? NSData
                    pageItemController.name = currentItem.valueForKey("add_name2") as String
                }
                if itemIndex == 2 {
                    pageItemController.imageName1 = currentItem.valueForKey("add_photo3") as? NSData
                    pageItemController.name = currentItem.valueForKey("add_name3") as String
                }
                if itemIndex == 3 {
                    pageItemController.imageName1 = currentItem.valueForKey("add_photo4") as? NSData
                    pageItemController.name = currentItem.valueForKey("add_name4") as String
                }
            }
            else{
                pageItemController.imageName = contentImages[itemIndex]
                
            }
            return pageItemController
        }
        
        return nil
    }
    
    // MARK: - Page Indicator
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return contentImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
