//
//  HttpAsyncHelper.m
//  Carros
//
//  Created by Ricardo Lecheta on 8/25/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//
#import "HttpAsyncHelper.h"
#import "HttpAsyncHelperDelegate.h"
@implementation HttpAsyncHelper
@synthesize delegate;
- (void) doGet:(NSString *)url {
    // Cria o NSMutableData para receber o retorno
    retornoHttp = [NSMutableData data];
    // Inicia a request HTTP, disparando de forma assíncrona
    // O delegate:self indica que vamos receber os eventos nessa classe
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection connectionWithRequest:request delegate:self];
}
#pragma mark - Http
// Recebeu uma resposta do servidor
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [retornoHttp setLength:0];
}
// Recebeu dados, então vamos adicionar no NSData
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [retornoHttp appendData:data];
}
// Ocorreu um erro
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    if (delegate) {
        // Avisa o delegate do erro
        [delegate requestEndWithError:error];
    }
}
// Terminou a requisição
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (delegate) {
        // Avisa o delegate que a requisição terminou
        [delegate requestEndWithData:retornoHttp];
    }
}
@end