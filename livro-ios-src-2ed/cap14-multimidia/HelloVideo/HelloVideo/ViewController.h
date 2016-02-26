//
//  ViewController.h
//  HelloVideo
//
//  Created by Ricardo Lecheta on 8/31/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VideoUtil.h"

@interface ViewController : UIViewController

- (IBAction) play;
- (IBAction) pause;
- (IBAction) stop;

// View no xib (container para o player)
@property (nonatomic, strong) IBOutlet UIView *videoView;
@property (nonatomic, strong) VideoUtil *videoUtil;

@end

