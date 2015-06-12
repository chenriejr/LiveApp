//
//  MainViewController.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/19/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit

// commentDelegate
class LiveStreamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, donateFromLivePerformanceStream, shareFromLivePerformanceStream, presentComment {

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
    var alert = AlertController()
    
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
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {   // only one cell for users, label, and live stream
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCellWithIdentifier(usersInAppCollectionViewReuseIdentifier,forIndexPath: indexPath) as! UsersInAppTableViewCell
        return cell
            
        }
        
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier(numberOfUsersCountReuseIdentifier, forIndexPath: indexPath) as! NumberOfUsersCountTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            // demo
            let hereNow = "1,445"
            cell.numberOfUsers.text = NSString(format: "%@ here now", hereNow) as String
            cell.liveFromVenue.text = "live from the xxx stage tonight in LA...#zzz"
            //
            return cell
        }
            
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier(livePerformanceStreamReuseIdentifier, forIndexPath: indexPath) as! LivePerformanceStreamTableViewCell
            // no highlight upon selection for live app cell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            // have a view in place for live stream, background just for demo
            cell.backgroundView = UIImageView(image: UIImage(named: "stream"))
            // delegates
            cell.donateDelegate = self
            cell.shareDelegate = self
            cell.postCommentDelegate = self
            //
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
        // profile pictures to circles
        cell.layer.cornerRadius = 22
//        cell.layer.borderWidth = 1
        //
        cell.backgroundColor = color
        
        return cell
    }
    
// MARK: Alert Delegate Actions
    func donateFromLivePerformance() {
        let donate = alert.donate()
        self.presentViewController(donate, animated: true, completion: nil)
    }
    
    func shareFromLivePerformance(text: String, url: NSURL) {
        
        let activityItems = [text, url]
        let share = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.navigationController?.presentViewController(share, animated: true, completion: nil)
    }
    
    func presentComment() {
        let comment = self.alert.shareComment()

        self.presentViewController(comment, animated: true, completion: nil)
    }
}
