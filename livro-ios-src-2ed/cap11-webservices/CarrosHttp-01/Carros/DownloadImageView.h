//
//  DownloadImageView.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/25/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>
@interface DownloadImageView : UIImageView {
    NSString *url;
    UIActivityIndicatorView *progress;
    NSOperationQueue *queue;
}
@property (nonatomic, copy) NSString *url;
@end