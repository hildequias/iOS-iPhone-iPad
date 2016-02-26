//
//  Prefs.m
//  Carros
//
//  Created by Ricardo Lecheta on 8/26/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "Prefs.h"

@implementation Prefs

+ (void) setString:(NSString *)valor chave:(NSString *)chave {
    // Cria o caminho com o arquivo
    NSString *arquivo = [Prefs getFilePath:chave];
    // Converte o valor para NSData
    NSData *data = [valor dataUsingEncoding:NSUTF8StringEncoding];
    // Escreve no arquivo
    [data writeToFile:arquivo atomically:YES];
}
+ (NSString *) getString:(NSString *)chave {
    // Cria o caminho com o arquivo
    NSString *arquivo = [Prefs getFilePath:chave];
    NSData* data = [NSData dataWithContentsOfFile:arquivo];
    NSString *valor = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
//    NSLog(@"Valor %@", valor);
    if(valor.length == 0) {
        return nil;
    }
    return valor;
}
+ (void) setInteger:(NSInteger)valor chave:(NSString *)chave {
    // Converte o número para string
    NSString *valorString = [NSString stringWithFormat:@"%d", valor];
    [Prefs setString:valorString chave:chave];
}
+ (NSInteger) getInteger:(NSString *)chave {
    NSString *valorString = [Prefs getString:chave];
    // Converte a string salva para número
    NSInteger valor = [valorString intValue];
    return valor;
}

+ (NSString *) getFilePath:(NSString *)chave {
    // Cria o caminho com o arquivo
    NSString *arquivo = [NSHomeDirectory() stringByAppendingString:[NSString
                                                                    stringWithFormat:@"/Documents/%@.txt", chave]];
    //NSLog(@"Caminho do arquivo: %@", arquivo);
    return arquivo;
}
    

@end
