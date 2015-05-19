//
//  UsersInAppTableViewCell.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/19/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit

let usersInAppCollectionViewCell = "usersInAppCollectionViewCell"

class UsersInAppTableViewCell: UITableViewCell {
    
    var collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewLayout())

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        flowLayout.itemSize = CGSizeMake(44, 44)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        // CollectionView
        self.collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: usersInAppCollectionViewCell)
        self.collectionView.backgroundColor = UIColor.lightGrayColor()
        self.collectionView.showsHorizontalScrollIndicator = false
        self.contentView.addSubview(self.collectionView)
//        return self
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let frame = self.contentView.bounds
        self.collectionView.frame = CGRectMake(0, 0.5, frame.size.width, frame.size.height - 1)
    }

    func setCollectionViewDataSourceDelegate(dataSource: protocol<UICollectionViewDataSource>, index: NSInteger) {
        self.collectionView.dataSource = dataSource
//        self.collectionView.delegate = delegate
        self.collectionView.tag = index
        self.collectionView.reloadData()
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate delegate: protocol<UICollectionViewDelegate,UICollectionViewDataSource>, indexPath: NSIndexPath) {
        self.collectionView.dataSource = delegate
        self.collectionView.delegate = delegate
//        self.collectionView.indexPath = indexPath
        self.collectionView.tag = indexPath.section
        self.collectionView.reloadData()
    }


}
