//
//  VideoViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/26/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoUtil.h"

#import "Carro.h"
@interface VideoViewController : UIViewController

@property (nonatomic, strong) Carro *carro;
@property (nonatomic, strong) IBOutlet UIWebView *webView;

@property (nonatomic, strong) VideoUtil *videoUtil;

- (void) videoFim;

@end
