//
//  SidePanelViewController.m
//  SlideOverMenu
//
//  Created by Carlos Irano on 24/04/15.
//  Copyright (c) 2015 Carlos Irano. All rights reserved.
//

#import "SidePanelViewController.h"

@interface SidePanelViewController ()

- (IBAction)tap:(id)sender;

@end

@implementation SidePanelViewController

- (instancetype)init {

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Menu" bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:@"RightViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.centerPanelExpandedOffset = CGRectGetWidth(self.view.frame) / 2;
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(mostraMenu:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(id)sender {
    [self.delegate abreOufechaMenu];
}

- (void)mostraMenu: (UIPanGestureRecognizer*)recognizer {
    CGPoint startLocation;
    CGPoint stopLocation;
    CGFloat distance;
    
    BOOL arrastouDaEsquerdaParaDireita = false;
    BOOL arrastouDaDireitaParaEsquerda = false;
    BOOL arrastouDedoTempoSuficiente = false;
    BOOL arrastouDeCimaParaBaixo = false;
    
    CGPoint velocity = [recognizer velocityInView:self.view];
    
    arrastouDaEsquerdaParaDireita = velocity.x > 0;
    arrastouDaDireitaParaEsquerda = velocity.x < 0;
    
    // calibra o que é permitido para o dedo subir ou descer na tela enquanto cliente arrasta o dedo para direita ou esquerda
    arrastouDeCimaParaBaixo = velocity.y > 500 || velocity.y < -500;
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        startLocation = [recognizer locationInView:self.view];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded) {
        stopLocation = [recognizer locationInView:self.view];
        
        CGFloat dx = stopLocation.x - startLocation.x;
        CGFloat dy = stopLocation.y - startLocation.y;
        distance =  sqrt(dx*dx + dy*dy);
        
        // calibra tempo do arrastar o dedo
        arrastouDedoTempoSuficiente = distance > 100;
        
        if (arrastouDedoTempoSuficiente && !arrastouDeCimaParaBaixo) {
            // arrastou para direita, puxa o menu
            if (arrastouDaEsquerdaParaDireita) {
                [self.delegate animalSelected];
                
            // arrastou para esquerda, esconde o menu
            } else if (arrastouDaDireitaParaEsquerda) {
                [self.delegate fechaOmenuComDedo];
            }
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
