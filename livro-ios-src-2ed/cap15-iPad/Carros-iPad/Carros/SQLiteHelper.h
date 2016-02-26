//
//  SQLiteHelper.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/26/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface SQLiteHelper : NSObject {
    sqlite3 *bancoDeDados;
}
// Abre o banco de dados
- (void) abrir:(NSString *)nomeBanco;
// Fecha o banco de dados
- (void) fechar;
// Retorna o SQL para criar a tabela (deve ser implementado pela sub-classe)
- (NSString *)getSQLCreate;
@end