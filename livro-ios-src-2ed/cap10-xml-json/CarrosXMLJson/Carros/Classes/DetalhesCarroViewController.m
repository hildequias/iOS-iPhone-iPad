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

@synthesize tDesc, img, imgHorizontal;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Título da Navigation Bar é o nome do carro
    
    self.title = carro.nome;
    
    // Atualiza o texto das views
    
    self.tDesc.text = carro.desc;
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:carro.url_foto]];
    
    UIImage *image = [[UIImage alloc] initWithData:data];
    
    self.img.image = image;
   
    self.imgHorizontal.image = image;
    
    UIDeviceOrientation o = [[UIDevice currentDevice] orientation];
    
    if (o == UIInterfaceOrientationLandscapeLeft ||
        o == UIInterfaceOrientationLandscapeRight) {

        // Executa o codigo para Horizontal
        [self willRotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft duration:1];
        
    }
}

#pragma mark rotation iOS 6

- (BOOL)prefersStatusBarHidden
{
    // Se a view for a horizontal pode esconder a status bar
    return self.view == self.viewHorizontal;
}

- (NSUInteger) supportedInterfaceOrientations {
    // Todas menos de ponta cabeça
    return UIInterfaceOrientationMaskAllButUpsideDown;
    
}

#pragma mark rotation
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration {
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        // Se for horizontal
        self.view = self.viewHorizontal;
        
        // Horizontal: Esconde tudo
        self.tabBarController.tabBar.hidden = YES;
        self.navigationController.navigationBar.hidden = YES;
        
        [self setNeedsStatusBarAppearanceUpdate];
    } else {
        // Se for vertical
        self.view = self.viewVertical;
        
        // Vertical: Exibe a tab bar e navigation bar
        self.tabBarController.tabBar.hidden = NO;
        self.navigationController.navigationBar.hidden = NO;
        
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

@end
