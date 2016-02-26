//
//  DetailViewController.h
//  BrowseOverflow
//
//  Created by Mobile6 on 9/3/15.
//  Copyright (c) 2015 Pixonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

