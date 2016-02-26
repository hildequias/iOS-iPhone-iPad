//
//  ViewController.h
//  HelloCamera
//
//  Created by Ricardo Lecheta on 8/31/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController <UINavigationControllerDelegate,
UIImagePickerControllerDelegate> {
    UIImagePickerController *imagePicker;
    IBOutlet UIImageView *imageView;
    IBOutlet UIButton *btnCamera;
    
//    UIPopoverController *popover;
    
}

@property (nonatomic, strong) UIPopoverController *popover;

- (IBAction) tirarFoto:(id)sender;
- (IBAction)escolherFoto:(id)sender;

@end