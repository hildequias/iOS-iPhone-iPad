//
//  SobreViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SobreViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *progress;

@end
