//
//  MeuSegundoViewController.m
//  BemVindo
//
//  Created by Ricardo Lecheta on 9/22/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "MeuSegundoViewController.h"

@implementation MeuSegundoViewController

@synthesize msg;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Copia o conteúdo da mensagem "msg" para o label
    
    label.text = msg;
    
    self.title = @"Segundo Controller";
}

- (IBAction)voltar {
    
    // 1) Window
    //[self.view removeFromSuperview];
    
    // 2) Modal
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    // 3) Nav Bar
    [self.navigationController popViewControllerAnimated:YES];
}

@end
