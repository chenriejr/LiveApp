//
//  CurrentlyLiveTableViewCell.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/20/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit

let currentlyLiveReuseIdentifier = "currentlyLiveTableViewCell"

class CurrentlyLiveTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
