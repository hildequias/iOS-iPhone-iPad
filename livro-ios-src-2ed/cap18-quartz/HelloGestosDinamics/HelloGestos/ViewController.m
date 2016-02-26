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
@synthesize animator;

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

- (void)testeGravidade:(id)sender {
    // Gravidade
    UIGravityBehavior* gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[self.imagem]];

    // Cria o UIDynamic
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    [self.animator addBehavior:gravityBeahvior];
}

- (void)testeGravidadeEColisao:(id)sender {
    // Gravidade
    UIGravityBehavior* gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[self.imagem]];

    // Colisão
    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.imagem]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    collisionBehavior.collisionDelegate = self;

    // Cria o UIDynamic
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    [self.animator addBehavior:gravityBeahvior];
    [self.animator addBehavior:collisionBehavior];
}

#pragma mark UICollisionBehaviorDelegate
-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    // Início da Colisão
    // Pinta a cor de fundo da imagem de verde, apenas para demonstrar que colidiu
    [(UIView*)item setBackgroundColor:[UIColor greenColor]];
}


-(void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier
{
    // Fim da colisão
    [(UIView*)item setBackgroundColor:[UIColor blueColor]];
}

#pragma mark dealloc
- (void)dealloc {
    // Remove todos os comportamentos
    [self.animator removeAllBehaviors];
}

@end
