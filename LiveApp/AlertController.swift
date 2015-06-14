//
//  AlertController.swift
//  LiveApp
//
//  Created by Trace Pomplun on 6/11/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit

let UITextFieldDidChangeNotification = "textFieldUpdate"

protocol commentDelegate
{
    func postComment(text: String)
}

class AlertController: UIAlertController {
    
    var comment: commentDelegate?
    
    func donate() -> UIAlertController {
        // just actions
        let donate = UIAlertController(title: "Support this artist", message: "How much would you like to give?", preferredStyle: .Alert)
        
        donate.addAction(UIAlertAction(title: "$5", style: .Default, handler: { (UIAlertAction) -> Void in
            // TODO: apple pay
        }))
        
        donate.addAction(UIAlertAction(title: "$10", style: .Default, handler: { (UIAlertAction) -> Void in
            // TODO: apple pay
        }))
        
        donate.addAction(UIAlertAction(title: "$20", style: .Default, handler: { (UIAlertAction) -> Void in
            // TODO: apple pay
        }))
        
        donate.addAction(UIAlertAction(title: "$30", style: .Default, handler: { (UIAlertAction) -> Void in
            // TODO: apple pay
        }))
        
//        donate.addTextFieldWithConfigurationHandler { (textField) -> Void in
//            textField.keyboardAppearance = UIKeyboardAppearance.Light
//            textField.keyboardType = UIKeyboardType.NumberPad
//        }
        
        return donate
    }
    
    func shareComment() -> UIAlertController {
        
        let comment = UIAlertController(title: "Type your comment below", message: nil, preferredStyle: .Alert)
        
        comment.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Comment"
        }
        
        comment.addAction(UIAlertAction(title: "Post", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            
            if let commentText = comment.textFields![0] as? UITextField {
                self.comment?.postComment(commentText.text)
            }

        }))
        
        return comment
    }
    
}
