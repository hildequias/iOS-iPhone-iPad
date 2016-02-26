//
//  CenterViewController.h
//  SlideOverMenu
//
//  Created by Carlos Irano on 24/04/15.
//  Copyright (c) 2015 Carlos Irano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CenterViewDelegate.h"
#import "SidePanelViewDelegate.h"

@interface MenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, SidePanelViewDelegate>

@property (nonatomic, strong) NSObject <CenterViewDelegate> *delegate;
@property (nonatomic, assign) CGFloat centerPanelExpandedOffset;

@end
