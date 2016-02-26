//
//  ViewController.m
//  HelloGestos
//
//  Created by Ricardo Lecheta on 9/15/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize imagem;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Tap
    UITapGestureRecognizer * recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
    recognizer.numberOfTapsRequired = 2;
    recognizer.delegate = self;
    // UserInteractionEnabled = YES
    [self.imagem addGestureRecognizer:recognizer];

    // Left
    UISwipeGestureRecognizer *recognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
    [recognizerLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.imagem addGestureRecognizer:recognizerLeft];
    
    // Right
    UISwipeGestureRecognizer *recognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
    [recognizerRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.imagem addGestureRecognizer:recognizerRight];
}

- (void) onTap {
    NSLog(@"handleTap");
}

- (void)swipeLeft {
    NSLog(@"swipeLeft");
}

- (void)swipeRight {
    NSLog(@"swipeRight");
}

@end
