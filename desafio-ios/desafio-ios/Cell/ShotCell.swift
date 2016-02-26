//
//  ShotCell.swift
//  desafio-ios
//
//  Created by Mobile6 on 11/3/15.
//  Copyright © 2015 Hildequias. All rights reserved.
//

import Foundation
import UIKit


class ShotCell: UICollectionViewCell {
    
    @IBOutlet var coverImageView : UIImageView!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var titleLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.textColor = UIColor.blackColor()
        nameLabel.font = UIFont(name: ThemeUtils.fontName, size: 14)
        
        titleLabel.textColor = UIColor(white: 0.45, alpha: 1.0)
        titleLabel.font = UIFont(name: ThemeUtils.fontName, size: 11)
        
        coverImageView.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).CGColor
        coverImageView.layer.borderWidth = 0.5
        
    }
}