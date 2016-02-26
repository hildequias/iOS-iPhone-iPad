//
//  TransacaoUtil.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/25/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transacao.h"
@interface TransacaoUtil: NSObject {
    NSOperationQueue *queue;
}
- (void)iniciarTransacao:(NSObject<Transacao> *)transacao;
@property (nonatomic, strong) NSObject<Transacao> *transacao;
@end