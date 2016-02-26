//
//  MeuPrimeiroViewController.h
//  BemVindo
//
//  Created by Ricardo Lecheta on 9/21/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeuSegundoViewController.h"

@interface MeuPrimeiroViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UILabel *meuPrimeiroLabel;
    
    IBOutlet UITextField *meuPrimeiroTextField;
    
    IBOutlet UITextField *meuSegundoTextField;
    
    IBOutlet UIImageView *imageView;
}
- (IBAction)olaMundo:(id)sender;

- (IBAction)sliderValueChanged:(id)sender;

@property (nonatomic,strong) MeuSegundoViewController *segundo;

@end
