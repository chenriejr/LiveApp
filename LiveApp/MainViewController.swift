//
//  MainViewController.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/20/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit

class MainViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        
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
        return cell
            
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier(upcomingPerformancesCellReuseIdentifier, forIndexPath: indexPath) as! UpcomingPerformancesTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.backgroundView = UIImageView(image: UIImage(named: "mock.1"))
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
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        // no footer unless last section
        if section == 1 {
        let header = tableView.dequeueReusableCellWithIdentifier(footerForMainViewControllerReuseIdentifier) as! FooterTableViewCellForMainViewController
        return header.contentView
        }
        else {
            var view = UIView()
            return view
        }
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44
    }
    
// MARK: Actions
    
}
