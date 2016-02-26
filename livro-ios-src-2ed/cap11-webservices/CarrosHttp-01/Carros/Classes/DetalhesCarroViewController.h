//
//  DetalhesViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Carro.h"
#import "DownloadImageView.h"

@interface DetalhesCarroViewController : UIViewController {
    
    Carro *carro;
    
}

@property (nonatomic, strong) Carro *carro;

@property (nonatomic, strong) IBOutlet DownloadImageView *img;

@property (nonatomic, strong) IBOutlet DownloadImageView *imgHorizontal;

@property (nonatomic, strong) IBOutlet UIView *viewVertical;

@property (nonatomic, strong) IBOutlet UIView *viewHorizontal;


@property (nonatomic, strong) IBOutlet UITextView *tDesc;


@end
