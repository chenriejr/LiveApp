
//
//  UpcomingPerformancesTableViewCell.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/20/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit

let upcomingPerformancesCellReuseIdentifier = "upcomingPerformancesCell"

class UpcomingPerformancesTableViewCell : UITableViewCell {
    
    @IBOutlet var goingConfirmation: UIButton!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // shape it into a square
    }
    
    func squareButton() {
        
        self.goingConfirmation.layer.cornerRadius = 2
        self.goingConfirmation.layer.borderWidth = 1
        self.goingConfirmation.layer.borderColor! = UIColor.blackColor().CGColor
    }

    @IBAction func confirmAttendance(sender: UIButton)
    {
        self.goingConfirmation.backgroundColor = UIColor.blueColor()
    }
}