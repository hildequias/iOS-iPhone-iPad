//
//  SidePanelViewController.h
//  SlideOverMenu
//
//  Created by Carlos Irano on 24/04/15.
//  Copyright (c) 2015 Carlos Irano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SidePanelViewDelegate.h"

@interface SidePanelViewController : UIViewController

@property (nonatomic, strong) NSObject <SidePanelViewDelegate> *delegate;

@end
