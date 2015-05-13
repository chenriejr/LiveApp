//
//  ViewController.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/12/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let logInButton = TWTRLogInButton { (session: TWTRSession!, error: NSError!) -> Void in
            
        }
        logInButton.center = self.view.center
        logInButton.titleLabel?.text = "Connect with Twitter"
        self.view.addSubview(logInButton)
        
        // autolayout Twitter
        logInButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var constrainY = NSLayoutConstraint.constraintsWithVisualFormat("V:[logInButton]-(<=50)-|", options: NSLayoutFormatOptions.AlignAllCenterX,
            metrics: nil,
            views: ["superview": view, "logInButton": logInButton])
        view.addConstraints(constrainY)
        
        var constrainX = NSLayoutConstraint(
            item: logInButton,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0)
        view.addConstraint(constrainX)
        //
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

