//
//  XMLCarroParser.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/21/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Carro.h"
@interface XMLCarroParser :NSObject <NSXMLParserDelegate> {
    // Lista de carros
    NSMutableArray *carros;
    // Variáveis auxiliares para o parser
    NSMutableString *tempString;
    Carro *carro;
}
// Para criar o getter [XMLCarroParser getCarros];
@property (nonatomic, strong) NSMutableArray *carros;
@end