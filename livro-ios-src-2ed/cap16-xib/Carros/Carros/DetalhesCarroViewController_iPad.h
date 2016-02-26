//
//  DetalhesCarroViewController_iPad.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/31/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetalhesCarroViewController.h"
@interface DetalhesCarroViewController_iPad : DetalhesCarroViewController <UISplitViewControllerDelegate>

@property (nonatomic, retain) IBOutlet UIView *videoView;
@property (nonatomic, retain) UIPopoverController *popover;
@property (nonatomic, retain) UIPopoverController *popoverController;

- (IBAction)abrirPopover:(id)sender;

@end
