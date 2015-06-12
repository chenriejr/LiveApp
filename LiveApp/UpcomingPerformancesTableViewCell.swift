
//
//  UpcomingPerformancesTableViewCell.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/20/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit

protocol shareFromUpcomingPerformances
{
    func share(text: String, url: NSURL)
}

let upcomingPerformancesCellReuseIdentifier = "upcomingPerformancesCell"

class UpcomingPerformancesTableViewCell : UITableViewCell {
    
    @IBOutlet var goingConfirmation: UIButton!
    // share
    var delegate: shareFromUpcomingPerformances?
    //
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    // shape it into a square
    func squareButton() {
        
        self.goingConfirmation.layer.cornerRadius = 2
        self.goingConfirmation.layer.borderWidth = 1
        self.goingConfirmation.layer.borderColor! = UIColor.blackColor().CGColor
    }

    @IBAction func share(sender: UIButton)
    {
        let text = "text"
        // if let
        let videoUrl = NSURL(string: "http://www.google.com/")!
        self.delegate?.share(text, url: videoUrl)
        //
    }
    
    @IBAction func confirmAttendance(sender: UIButton)
    {
        sender.backgroundColor = UIColor.blackColor()
    }
}