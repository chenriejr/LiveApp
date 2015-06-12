//
//  NumberOfUsersCountTableViewCell.swift
//  LiveApp
//
//  Created by Trace Pomplun on 6/11/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit

let numberOfUsersCountReuseIdentifier = "count"

class NumberOfUsersCountTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberOfUsers: UILabel!
    @IBOutlet weak var liveFromVenue: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
