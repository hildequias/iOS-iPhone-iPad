//
//  CommentCell.swift
//  desafio-ios
//
//  Created by Mobile6 on 11/3/15.
//  Copyright © 2015 Hildequias. All rights reserved.
//

import Foundation
import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet var profileImageView : UIImageView!
    @IBOutlet var dateImageView : UIImageView!

    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var postLabel : UILabel!
    @IBOutlet var dateLabel : UILabel!

    override func awakeFromNib() {
        
        dateImageView.image = UIImage(named: "clock")
        dateImageView.alpha = 0.20
        profileImageView.layer.cornerRadius = 15
        profileImageView.clipsToBounds = true
        
        nameLabel.font = UIFont(name: ThemeUtils.fontName, size: 16)
        nameLabel.textColor = ThemeUtils.darkColor

        postLabel?.font = UIFont(name: ThemeUtils.fontName, size: 12)
        postLabel?.textColor = ThemeUtils.lightColor
        
        dateLabel.font = UIFont(name: ThemeUtils.fontName, size: 11)
        dateLabel.textColor = ThemeUtils.lightColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        postLabel.preferredMaxLayoutWidth = CGRectGetWidth(postLabel.frame)

    }
}