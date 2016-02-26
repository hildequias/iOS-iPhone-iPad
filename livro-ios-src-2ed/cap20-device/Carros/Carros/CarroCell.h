//
//  CarroCell.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/18/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadImageView.h"

// Classe filha de UITableViewCell
@interface CarroCell : UITableViewCell {

}

@property (nonatomic, retain) IBOutlet UILabel *cellDesc;
@property (nonatomic, retain) IBOutlet DownloadImageView *cellImg;

@end
