//
//  main.m
//  OlaObjectiveC_No_ARC
//
//  Created by Ricardo Lecheta on 9/4/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Carro.h"
#import "LavaCar.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Carro *c1 = [[Carro alloc] initWithNome:@"Fusca" andAno:1934];
        
        Carro *c2 = [[Carro alloc] initWithNome:@"Chevette" andAno:1973];
        
        LavaCar *l = [[LavaCar alloc] init];
        
        // Deixa o primeiro carro no LavaCar
        
        [l setCarro:c1];
        
        [l lavarCarro];
        
        // Deixa o segundo carro no LavaCar
        
        [l setCarro:c2];
        
        [l lavarCarro];
        
        // Libera a memória
        
        [c1 release];
        
        [c2 release];
        
        [l release];
    }
    return 0;
}

