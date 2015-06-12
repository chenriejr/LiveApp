//
//  MainViewController.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/20/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit
import TwitterKit

class MainViewController : UIViewController, UITableViewDataSource, UITableViewDelegate, shareFromUpcomingPerformances {
    
    @IBOutlet weak var tableView: UITableView!
    let userInfo = UserInfo()
    
    override func viewDidLoad() {
        
        // title
        self.title = "Live App"
        // demo
        self.userInfo.getUserInfo { (userInfo) -> Void in
            println(userInfo)
        }
        //
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // prep for dynamic cell content
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
// MARK: Datasource methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {   // currently live section == 0
        if section == 0 {
            return 1
        }
        else {
            return 2
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.section == 0 {
            
        let cell = tableView.dequeueReusableCellWithIdentifier(currentlyLiveReuseIdentifier, forIndexPath: indexPath) as! CurrentlyLiveTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.backgroundView = UIImageView(image: UIImage(named: "mock"))
        // red indicator for live
        cell.liveBox.layer.borderWidth = 1
        cell.liveBox.layer.borderColor = UIColor.redColor().CGColor
        //
        return cell
            
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier(upcomingPerformancesCellReuseIdentifier, forIndexPath: indexPath) as! UpcomingPerformancesTableViewCell
            // share delegate
            cell.delegate = self
            //
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.backgroundView = UIImageView(image: UIImage(named: "kendrick"))
            // button to square
            cell.squareButton()
        
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 350
    }
    
// MARK: Header for cells
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        let header = tableView.dequeueReusableCellWithIdentifier(headerForMainViewControllerReuseIdentifier) as! HeaderForMainViewControllerTableViewCell
//        return header.contentView
//    }
//    
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 64
//    }
    
// FOOTER: Footer for cells
//    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        // no footer unless last section
//        if section == 1 {
//        let header = tableView.dequeueReusableCellWithIdentifier(footerForMainViewControllerReuseIdentifier) as! FooterTableViewCellForMainViewController
//        return header.contentView
//        }
//        else {
//            var view = UIView()
//            return view
//        }
//    }
    
//    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 44
//    }
    
// MARK: Protocol shareFromUpcomingPerformances
    func share(text: String, url: NSURL) {
        let activityItems = [text, url]
        let shareController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.navigationController?.presentViewController(shareController, animated: true, completion: nil)
    }
    
}
