//
//  CarroDBCoreData.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/27/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Carro.h"
@interface CarroDBCoreData : NSObject
// Cria uma instância do Carro (inserindo no managed object context)
+ (Carro *) newInstance;
// Consulta os carros por tipo
- (NSMutableArray *) getCarrosTipo:(NSString *)tipo;
// Salva ou atualiza o carro
- (void) salvar:(Carro *)carro;
// Deleta todos os carros por tipo
- (void) deletarCarrosTipo:(NSString *)tipo;
// Deleta o carro
- (void) deletar:(Carro *)carro;
@end