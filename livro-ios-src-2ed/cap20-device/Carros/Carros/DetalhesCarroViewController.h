//
//  DetalhesCarroViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/18/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Carro.h"
#import "DownloadImageView.h"

@interface DetalhesCarroViewController : UIViewController

@property (nonatomic, strong) Carro *carro;
@property (nonatomic, strong) IBOutlet DownloadImageView *img;
@property (nonatomic, strong) IBOutlet UITextView *tDesc;

- (IBAction) visualizarMapa;
- (IBAction) visualizarVideo;

- (void) exibeCarro;

@end
