//
//  UsersInAppTableViewCell.swift
//  LiveApp
//
//  Created by Trace Pomplun on 5/19/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

import UIKit

let usersInAppCollectionViewReuseIdentifier = "usersInApp"

class UsersInAppTableViewCell: UITableViewCell {
    // TODO: filler only so it runs non nil layout param
    // var collectionView = UsersInAppCollectionView
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
        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: usersInAppCollectionViewReuseIdentifier)
        self.collectionView.backgroundColor = UIColor.whiteColor()
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

    func setCollectionViewDataSourceDelegate(dataSourceDelegate delegate: protocol<UICollectionViewDelegate,UICollectionViewDataSource>, index: NSInteger) {
        self.collectionView.dataSource = delegate
        self.collectionView.delegate = delegate
        self.collectionView.tag = index
        self.collectionView.reloadData()
    }

}
