//
//  CarroService.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarroService : NSObject

+ (NSMutableArray *) getCarros;

// Busca por os carros pelo tipo: esportivos, clássicos ou luxo
+ (NSMutableArray *)getCarrosByTipo:(NSString *)tipo;

// Cache = YES: Indica que o banco de dados deve ser consultado
// Cache = NO: Indica que a busca deve ser feita online
+ (NSMutableArray *)getCarrosByTipo:(NSString *)tipo cache:(BOOL)cache;

// Parser de XML com SAX

+ (NSMutableArray *) parserXML_SAX :(NSData *) data;

// Parser de XM com DOM

+ (NSMutableArray *) parserXML_DOM:(NSData *) data;

// Parser de JSON

+ (NSMutableArray *) parserJSON:(NSData *) data;



@end
