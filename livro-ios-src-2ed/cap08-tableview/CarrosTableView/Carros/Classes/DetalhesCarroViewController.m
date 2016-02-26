//
//  DetalhesViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "DetalhesCarroViewController.h"

@implementation DetalhesCarroViewController

@synthesize carro;

@synthesize tDesc, img;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Título da Navigation Bar é o nome do carro
    
    self.title = carro.nome;
    
    // Atualiza o texto das views
    
    self.tDesc.text = carro.desc;
    
    self.img.image = [UIImage imageNamed:carro.url_foto];
    
}

@end
