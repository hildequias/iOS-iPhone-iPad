//
//  ViewController.h
//  HelloGestos
//
//  Created by Ricardo Lecheta on 9/15/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate, UICollisionBehaviorDelegate>

@property (nonatomic, strong) IBOutlet UIView* imagem;

- (void) onTap;
- (void) swipeLeft;
- (void) swipeRight;

@property (nonatomic) UIDynamicAnimator* animator;

- (IBAction)testeGravidade:(id)sender;
- (IBAction)testeGravidadeEColisao:(id)sender;

@end
