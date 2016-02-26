//
//  MyScene.m
//  HelloSpriteKit
//
//  Created by Ricardo Lecheta on 9/15/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        // Define a cor de fundo do cenário
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        // Cria um label para desenhar no cenário
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        // Adiciona o label no cenário
        [self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Chamado quando ocorrer um evento de touch */
    
    // Recupera o touch
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint location = [touch locationInNode:self];

    // Se não existe cria o Sprite
    if(! sprite) {
        // Cria o Sprite com a imagem Spaceship.png
        sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        // Define que a posicão do sprite é a posição do Touch
        sprite.position = location;
        
        // Cria uma ação para o sprite girar em um angulo de PI
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        // Executa a ação com a opção para executar continuamente
        [sprite runAction:action];
        
        // Adiciona o Sprite no cenário
        [self addChild:sprite];
        NSLog(@"Sprite adicionado");
    } else {
        // Se existe verifica se o touch foi no sprite
        if([sprite containsPoint:location]) {
            // Remove o sprite do cenário
            [sprite removeFromParent];
            NSLog(@"Sprite removido");
            
            sprite = nil;
        } else {
            // Move o sprite para a nova localização
            NSLog(@"MoveTo %f/%f", location.x, location.y);
            SKAction *actionMover = [SKAction moveTo:location duration:1.0];
            [sprite runAction:actionMover];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Chamado sempre antes de renderizar um frame do cenário */
//    NSLog(@"update %f", currentTime);
}

@end
