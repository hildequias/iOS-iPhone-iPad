//
//  Transacao.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/25/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol Transacao <NSObject>
// Este método vai executar em uma thread separada
- (void) transacaoExecutar;
// Este método vai executar na thread principal - UI Thread
- (void) transacaoAtualizarInterface;
@end