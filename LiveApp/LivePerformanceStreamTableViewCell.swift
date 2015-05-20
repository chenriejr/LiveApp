//
//  MainTableViewCell.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/19/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit

let livePerformanceStreamReuseIdentifier = "livePerformanceStreamCell"

class LivePerformanceStreamTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
