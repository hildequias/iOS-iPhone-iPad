//
//  Carro.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Carro : NSObject

{
    NSString *nome;
    
    NSString *desc;
    
    // Url para a foto do carro (cap 10 e 11)
    
    NSString *url_foto;
    
    // Url com um site com informações do carro
    
    NSString *url_info;
    
    // Url com o vídeo do carro (cap 14)
    
    NSString *url_video;
    
    // Coordenadas da fábrica ou país de origem do carro (cap 13)
    
    NSString *latitude;
    
    NSString *longitude;
}

@property (nonatomic, strong) NSString *nome;

@property (nonatomic, strong) NSString *desc;

@property (nonatomic, strong) NSString *url_foto;

@property (nonatomic, strong) NSString *url_info;

@property (nonatomic, strong) NSString *url_video;

@property (nonatomic, strong) NSString *latitude;

@property (nonatomic, strong) NSString *longitude;

@end
