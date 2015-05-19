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
        
        // test
//        NetworkController.sharedInstance.verifyCredentials()
        
        // accessible session var?
        
        let logInButton = TWTRLogInButton(logInCompletion: { (session, error) in
                if (session != nil) {
                    
                    println("signed in as \(session.userName)");
                    self.performSegueWithIdentifier("sessionValid", sender: self)
                    
                } else {
                    println("error: \(error.localizedDescription)");
                }
        })
            
        
        
        logInButton.center = self.view.center
//        logInButton.backgroundColor = UIColor.lightGrayColor()
//        logInButton.titleLabel?.text = "Connect with Twitter"
        self.view.addSubview(logInButton)
        
        // autolayout Twitter
        logInButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var constrainY = NSLayoutConstraint.constraintsWithVisualFormat("V:[logInButton]-(<=40)-|", options: NSLayoutFormatOptions.AlignAllCenterX,
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

   
    @IBAction func logout(sender: AnyObject) {
        
        Twitter.sharedInstance().logOut()
        println("logged out")
    }


}

