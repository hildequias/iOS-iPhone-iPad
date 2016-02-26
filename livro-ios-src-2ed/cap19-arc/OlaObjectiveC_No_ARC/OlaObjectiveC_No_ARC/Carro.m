//
//  Carro.m
//  OlaObjectiveC_No_ARC
//
//  Created by Ricardo Lecheta on 9/4/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "Carro.h"

@implementation Carro

-  (Carro *) initWithNome:(NSString *)_nome andAno:(int)_ano {
    self = [super init];
    if(self) {
        [self setNome:_nome];
        [self setAno:_ano];
    }
    return self;
}
- (void) setNome:(NSString*)_nome {
    nome = _nome;
}
- (NSString *) getNome {
    return nome;
}
- (void) setAno:(int)_ano {
    ano = _ano;
}
- (int) getAno {
    return ano;
}
- (void) dealloc {
    [super dealloc];
    NSLog(@"Tchau carro");
}

@end
