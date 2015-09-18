//
//  ViewController.swift
//  LunchSlideShow
//
//  Created by sunny sun on 15/9/17.
//  Copyright (c) 2015年 sunny sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    func isAppAlreadyLaunchedOnce()->Bool{
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let isAppAlreadyLaunched = defaults.stringForKey("isAlreadyLaunched"){
            return true
        }else{
            defaults.setBool(true, forKey: "isAlreadyLaunched")
            return false
        }
    }
    
    func firstLaunchSlideShow(){
        println("launch first start image slide show\n")
        
        var slideimage1 = UIImage(named: "SlideBG1")
        var slideimage2 = UIImage(named: "SlideBG2")
        var slideimage3 = UIImage(named: "SlideBG3")
        
        var imageArray = [AnyObject]()
        imageArray.append(slideimage1!)
        imageArray.append(slideimage2!)
        imageArray.append(slideimage3!)
        
        
        //var imageRect = CGRect(x: 0, y: 0, width: 200, height: 300)
        //let slideImageView = UIImageView(frame: imageRect)
        
        let screenSize:CGRect = UIScreen.mainScreen().bounds
        let slideImageView = UIImageView(frame: screenSize)
        
        self.view.addSubview(slideImageView)
        
    
        slideImageView.animationImages = imageArray
        slideImageView.animationRepeatCount = 1
        slideImageView.animationDuration = 15.0
        slideImageView.startAnimating()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let firstLaunchFlags = isAppAlreadyLaunchedOnce()
        
        if firstLaunchFlags==false{
            firstLaunchSlideShow()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

