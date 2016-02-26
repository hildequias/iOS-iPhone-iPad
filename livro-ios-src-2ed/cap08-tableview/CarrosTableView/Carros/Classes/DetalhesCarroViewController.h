//
//  DetalhesViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Carro.h"

@interface DetalhesCarroViewController : UIViewController {
    
    Carro *carro;
    
}

@property (nonatomic, strong) Carro *carro;

@property (nonatomic, strong) IBOutlet UIImageView *img;

@property (nonatomic, strong) IBOutlet UITextView *tDesc;

@end
