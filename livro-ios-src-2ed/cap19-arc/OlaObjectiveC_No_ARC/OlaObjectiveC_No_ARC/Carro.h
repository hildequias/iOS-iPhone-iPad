//
//  Carro.h
//  OlaObjectiveC_No_ARC
//
//  Created by Ricardo Lecheta on 9/4/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Carro : NSObject {
    NSString *nome;
    int ano;
}
- (Carro *) initWithNome:(NSString *)_nome andAno:(int)_ano;
- (void) setNome:(NSString*)_nome;
- (NSString *) getNome;
- (void) setAno:(int)_ano;
- (int) getAno;

@end