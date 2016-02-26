//
//  ListController.swift
//  desafio-ios
//
//  Created by Mobile6 on 11/3/15.
//  Copyright © 2015 Hildequias. All rights reserved.
//

import Foundation
import UIKit

class ListController : UIViewController , UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var layout : UICollectionViewFlowLayout!
    
    var shots : [Shot]!
    var bucketIds : [String]!
    var currentBucket = 0
    
    var cellHeight : CGFloat = 240
    
    var api : DribbbleAPI!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shots"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let cellWidth = calcCellWidth(self.view.frame.size)
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        
        self.shots = [Shot]()
        self.api = DribbbleAPI()
        self.currentBucket = 0
        
        bucketIds = ["199775-UI-Design-Elements","257437-DUX", "260054-Music-App", "263305-UI"]
        
        getMoreShotsFromBuckets()
    }
    
    func didLoadShots(loadedShots: [Shot]){
        
        for shot in loadedShots {
            self.shots.append(shot)
        }
        collectionView.reloadData()
    }
    
    func getMoreShotsFromBuckets(){
     
        if currentBucket < bucketIds.count {
            
            let url = "https://api.dribbble.com/v1/buckets/\(bucketIds[currentBucket])/shots"
            api.loadShotsForBucket(url, completion: didLoadShots)
            
            currentBucket++
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ShotCell", forIndexPath: indexPath) as! ShotCell
        
        let shot = shots[indexPath.row]
        
        cell.titleLabel.text = shot.title
        cell.nameLabel.text = shot.user.name
        cell.coverImageView.image = nil
        Utils.asyncLoadShotImage(shot, imageView: cell.coverImageView)
         
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shots.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

        let endScrolling = scrollView.contentOffset.y + scrollView.frame.size.height;
        if endScrolling >= scrollView.contentSize.height {
            getMoreShotsFromBuckets()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        let cellWidth = calcCellWidth(size)
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
    }
    
    func calcCellWidth(size: CGSize) -> CGFloat {
        let transitionToWide = size.width > size.height
        var cellWidth = size.width / 2
        
        if transitionToWide {
            cellWidth = size.width / 3
        }
        
        return cellWidth
    }    
}
