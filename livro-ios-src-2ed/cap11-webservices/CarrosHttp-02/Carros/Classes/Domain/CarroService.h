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

+ (NSMutableArray *) getCarrosByTipo :(NSString *) tipo;

// Parser de XML com SAX

+ (NSMutableArray *) parserXML_SAX :(NSData *) data;

// Parser de XM com DOM

+ (NSMutableArray *) parserXML_DOM:(NSData *) data;

// Parser de JSON

+ (NSMutableArray *) parserJSON:(NSData *) data;



@end
