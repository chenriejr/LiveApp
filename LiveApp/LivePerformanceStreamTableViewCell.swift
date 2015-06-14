//
//  MainTableViewCell.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/19/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit

protocol donateFromLivePerformanceStream
{
    func donateFromLivePerformance()
}

protocol shareFromLivePerformanceStream
{
    func shareFromLivePerformance(text: String, url: NSURL)
}

protocol presentComment
{
    func presentComment()
}

let livePerformanceStreamReuseIdentifier = "livePerformanceStreamCell"

class LivePerformanceStreamTableViewCell: UITableViewCell, commentDelegate {
    // delegates
    var donateDelegate: donateFromLivePerformanceStream?
    var shareDelegate: shareFromLivePerformanceStream?
    var presentCommentDelegate: presentComment?
    //

    @IBOutlet weak var comments: UITextView!
    
    var alert = AlertController()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
// MARK: Actions
    
    @IBAction func donate(sender: UIButton)
    {
        self.donateDelegate?.donateFromLivePerformance()
    }
    
    @IBAction func comment(sender: UIButton)
    {
        let comment = self.alert.shareComment()
        self.alert.comment = self
        self.presentCommentDelegate?.presentComment()
    }

    @IBAction func share(sender: UIButton)
    {
        let text = "text"
        let url = NSURL(string: "http://www.google.com/")!
        
        self.shareDelegate?.shareFromLivePerformance(text, url: url)
    }

// MARK: Comment Delegate
    func postComment(text: String) {

        self.comments.text = text
    }
    
}
