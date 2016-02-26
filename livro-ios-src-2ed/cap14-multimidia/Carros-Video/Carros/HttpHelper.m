//
//  HttpHelper.m
//  Carros
//
//  Created by Ricardo Lecheta on 8/25/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "HttpHelper.h"
@implementation HttpHelper
- (NSData *) doGet:(NSString *) url {
    // Cria a request, sem cache e com timeout de 30seg
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]
                                             cachePolicy:(NSURLRequestReloadIgnoringLocalCacheData) timeoutInterval:30];
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = nil;
    // Faz a requisição de forma síncrona, que já retorna o NSData
    // Este método vai ficar travado até o servidor retornar
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&urlResponse error:&error];
    return data;
}
@end