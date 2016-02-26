//
//  ViewController.m
//  HelloQuartz2D
//
//  Created by Ricardo Lecheta on 10/18/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "ViewController.h"
#import "ViewLegal.h"
#import "ViewTouch.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // A ViewLegal está adicionada no arquivo xib
    
    // Descomente para testar a ViewTouch
//    int largura = self.view.frame.size.width;
//    int altura = self.view.frame.size.height;
//    ViewTouch *view = [[ViewTouch alloc] initWithFrame:CGRectMake(0, 0, largura, altura)];
//    [self.view addSubview:view];
    
    UITapGestureRecognizer * recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer {
    NSLog(@"OK!");
}

@end
