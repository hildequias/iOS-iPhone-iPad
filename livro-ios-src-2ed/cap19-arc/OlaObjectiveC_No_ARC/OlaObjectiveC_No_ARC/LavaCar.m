//
//  LavaCar.m
//  OlaObjectiveC_No_ARC
//
//  Created by Ricardo Lecheta on 9/5/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "LavaCar.h"

@implementation LavaCar

@synthesize carro;

- (void)lavarCarro {
    
    NSLog(@"Lavando o carro %@ (%d)", [self.carro getNome], [self.carro getAno]);
    
}

- (void)dealloc {
    
    // Para cada retain, um release
    
    [self.carro release];
    
    [super dealloc];
    
    NSLog(@"Tchau LavaCar");
    
}

@end