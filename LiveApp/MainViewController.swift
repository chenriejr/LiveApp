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
let usersInAppCell = "usersInApp"

class MainViewController: UIViewController, UITableViewDataSource, UICollectionViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let red = UIColor.redColor()
    let blue = UIColor.blueColor()
    let black = UIColor.blackColor()
    let grey = UIColor.lightGrayColor()
    let yellow = UIColor.yellowColor()
    
    var collectionArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        NetworkController.sharedInstance.verifyCredentials()
        self.tableView.dataSource = self
        
        // mock
        self.collectionArray = [red, blue, black, grey, yellow]
    }
    
// MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(usersInAppCell, forIndexPath: indexPath) as! UITableViewCell
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        let collectionCell: UsersInAppTableViewCell = cell as! UsersInAppTableViewCell

        let index: NSInteger = collectionCell.collectionView.tag
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
// MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.collectionArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionView", forIndexPath: indexPath) as! UICollectionViewCell
        
        let color = self.collectionArray[indexPath.row]
        cell.backgroundColor = color
        return cell
    }
}
