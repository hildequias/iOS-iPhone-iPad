//
//  VideoViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/30/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Carro.h"
#import "VideoUtil.h"
@interface VideoViewController : UIViewController

@property (nonatomic, retain) Carro *carro;
@property (nonatomic, retain) IBOutlet UIWebView *webView;

@property (nonatomic, retain) VideoUtil *videoUtil;

- (void) videoFim;

@end
