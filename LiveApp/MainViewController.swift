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

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let red = UIColor.redColor()
    let blue = UIColor.blueColor()
    let black = UIColor.blackColor()
    let grey = UIColor.lightGrayColor()
    let yellow = UIColor.yellowColor()
    let green  = UIColor.greenColor()
    let orange = UIColor.orangeColor()
    let magenta = UIColor.magentaColor()
    let brown = UIColor.brownColor()
    
    var collectionArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        NetworkController.sharedInstance.verifyCredentials()
        self.tableView.dataSource = self
        self.tableView.registerClass(UsersInAppTableViewCell.self, forCellReuseIdentifier: usersInAppCell)
        self.tableView.delegate = self
        // mock test
        self.collectionArray = [red, blue, black, grey, yellow, green, orange, magenta, brown]
    }
    
// MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(usersInAppCell, forIndexPath: indexPath) as! UsersInAppTableViewCell
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        let collectionCell = cell as! UsersInAppTableViewCell
        collectionCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, index: indexPath.row)
        let index: NSInteger = collectionCell.collectionView.tag
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {   // TODO: behavior of item size not defined if less than 70
        return 80
    }
    
// MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.collectionArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(usersInAppCollectionViewCell, forIndexPath: indexPath) as! UICollectionViewCell
        
        let color = self.collectionArray[indexPath.row]
        cell.backgroundColor = color
        return cell
    }
    

}
