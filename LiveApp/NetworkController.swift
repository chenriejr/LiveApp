//
//  NetworkController.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/13/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit

private let SingletonSharedInstance = NetworkController()

class NetworkController: NSObject {
    
    class var sharedInstance: NetworkController {
        return SingletonSharedInstance
    }
    // get users info from twitter
    func verifyCredentials() {
    
    var error = NSError()
        
    let baseURL = "https://api.twitter.com/1.1/account/verify_credentials.json"
    var session = NSURLSession.sharedSession()
    var requst = NSMutableURLRequest(URL: NSURL(string: baseURL)!)
        
        var task = session.dataTaskWithRequest(requst, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if (error != nil) {
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
                    println(json)
                }
                
            }
        
    })
    task.resume()
    //
        
    }
    

}
