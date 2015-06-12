//
//  NetworkController.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/13/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit
import TwitterKit

private let TwitterVerifyCredentials = "https://api.twitter.com/1.1/account/verify_credentials.json"

class UserInfo : NSObject {
    
    // get users info from twitter
    func getUserInfo(completion: (userInfo: [String?]) -> Void) {
        //
        Twitter.sharedInstance().logInWithCompletion { (session: TWTRSession!, error: NSError!) -> Void in
            Twitter.sharedInstance().APIClient.loadUserWithID(session.userID, completion: { (user: TWTRUser?, error: NSError?) -> Void in
                
                completion(userInfo: [user?.name, user?.profileImageURL])
            })
            
        }
        
    }
    

}
