//
//  MainViewController.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/19/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit

// cell constants
let mainCell = "mainCell"

class LiveStreamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    // mock for users prof
    let red = UIColor.redColor()
    let blue = UIColor.blueColor()
    let black = UIColor.blackColor()
    let grey = UIColor.lightGrayColor()
    let yellow = UIColor.yellowColor()
    let green  = UIColor.greenColor()
    let orange = UIColor.orangeColor()
    let magenta = UIColor.magentaColor()
    let brown = UIColor.brownColor()
    ////
    var collectionArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        NetworkController.sharedInstance.verifyCredentials()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerClass(UsersInAppTableViewCell.self, forCellReuseIdentifier: usersInAppCollectionViewReuseIdentifier)
        // prep for dynamic cell content
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        // mock users profile
        self.collectionArray = [red, blue, black, grey, yellow, green, orange, magenta, brown]
    }
    
// MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0 {
        return 1
        }
        else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCellWithIdentifier(usersInAppCollectionViewReuseIdentifier, forIndexPath: indexPath) as! UsersInAppTableViewCell
        
        return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier(livePerformanceStreamReuseIdentifier, forIndexPath: indexPath) as! LivePerformanceStreamTableViewCell
            // no highlight upon selection for live app cell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if indexPath.section == 0 {
        let collectionCell = cell as! UsersInAppTableViewCell
        collectionCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, index: indexPath.row)
        let index: NSInteger = collectionCell.collectionView.tag
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {   // TODO: behavior of item size not defined if less than 70
        if indexPath.section == 0 {
            return 80
        }
        else {
            return UITableViewAutomaticDimension
        }
    }
    
// MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.collectionArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(usersInAppCollectionViewReuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
        
        let color = self.collectionArray[indexPath.row]
        cell.backgroundColor = color
        
        return cell
    }
    
// MARK: Button Actions
    
    @IBAction func home(sender: UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func like(sender: UIButton)
    {
        
    }
    
    @IBAction func message(sender: UIButton)
    {
        
    }
    
    @IBAction func share(sender: UIButton)
    {
        
    }
    
    @IBAction func star(sender: UIButton)
    {
        
    }
    
}
