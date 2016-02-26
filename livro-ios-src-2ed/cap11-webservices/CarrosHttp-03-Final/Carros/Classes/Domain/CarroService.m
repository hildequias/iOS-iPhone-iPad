//
//  CarroService.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "CarroService.h"
#import "Carro.h"
#import "XMLCarroParser.h"
#import "SMXMLDocument.h"
#import "SBJson.h"
#import "HttpHelper.h"

@implementation CarroService

+ (NSMutableArray *) getCarros {
    
    NSMutableArray *carros = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 20; i++) {
        
        Carro *c = [[Carro alloc] init];
        
        [c setNome:[NSString stringWithFormat:@"Carro %d", i]];
        [c setDesc:[NSString stringWithFormat:@"Desc Carro %d", i]];
        [c setUrl_foto:@"Ferrari_FF.png"];
        [c setUrl_info:@"http://www.google.com.br"];
        
        // Adiciona o carro no array e faz release
        
        [carros addObject:c];
        
    }
    
    return carros;
    
}

+ (NSMutableArray *)getCarrosByTipo:(NSString *)tipo {
    
    // URL
	NSString *url = [NSString stringWithFormat:URL_CARROS, tipo];

	// Faz a requisição HTTP
	HttpHelper *http = [[HttpHelper alloc] init];
	NSData *data = [http doGet:url];
    NSLog(@"URL %@", url);

	// Faz o parser do XML
	NSMutableArray *carros = [self parserXML_DOM:data];
	return carros;
}

// Parser de XML com SAX

+ (NSMutableArray *) parserXML_SAX :(NSData *) data {
    
    if (!data || [data length] == 0) {
        
        NSLog(@"Nenhum dado encontrado");
        
        return nil;
        
    }
    
    NSXMLParser* xmlParser = [[NSXMLParser alloc] initWithData:data];
    
    //NSString *s = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    //NSLog(@"XML: %@", s);
    
    // Cria o parser dos Carros, e informa o "xmlParser" que ela é  o delegate (para receber
    
    // os eventos de parser)
    
    XMLCarroParser *carrosParser = [XMLCarroParser alloc];
    
    [xmlParser setDelegate: carrosParser];
    
    // Inicia o parser com o NSXMLParser, o que vai chamar a classe XMLCarroParser
    
    BOOL ok = [xmlParser parse];
    
    NSMutableArray * carros;
    
    if (ok) {
        
        // Fez o parser com sucesso, retorna a lista de carros
        
        carros = carrosParser.carros;
        
    } else {
        
        NSLog(@"Erro no parser");
        
        return nil;
        
    }
    
    // Retorna a lista de carros
    
    return carros;
    
}

// Faz o parser com DOM

+ (NSMutableArray *) parserXML_DOM:(NSData *) data {
    
    if (!data || [data length] == 0) {
        
        NSLog(@"Nenhum dado encontrado");
        
        return nil;
        
    }
    
    // Cria a estrutura "Document" para ler o XML
    
    NSError *error;
    
    SMXMLDocument *document = [SMXMLDocument documentWithData:data error:&error];
    
    // Verifica se aconteceu algum erro ao abrir o XML
    
    if (error) {
        
        NSLog(@"Error while parsing the document: %@", error);
        
        return nil;
        
    }
    
    NSMutableArray * carros = [[NSMutableArray alloc] init];
    
    
    
    // Lê  a tag raiz <carros>
    
    SMXMLElement *tagCarros = document.root;
    
    // Percorre todas as tags <carro>
    
    for (SMXMLElement *tagCarro in [tagCarros childrenNamed:@"carro"]) {
        
        Carro *c = [[Carro alloc] init];
        
        c.nome  = [tagCarro valueWithPath:@"nome"];
        
        c.desc  = [tagCarro valueWithPath:@"desc"];
        
        c.url_info = [tagCarro valueWithPath:@"url_info"];
        
        c.url_foto = [tagCarro valueWithPath:@"url_foto"];
        
        c.url_video = [tagCarro valueWithPath:@"url_video"];
        
        c.latitude = [tagCarro valueWithPath:@"latitude"];
        
        c.longitude = [tagCarro valueWithPath:@"longitude"];
        
        [carros addObject:c];
    }
    
    // Retorna a lista de carros
    
    return carros;
    
}

// Faz o parser do JSON

+ (NSMutableArray *) parserJSON:(NSData *) data {
    
    if (!data || [data length] == 0) {
        
        NSLog(@"Nenhum dado encontrado");
        
        return nil;
        
    }
    
    NSMutableArray * carros = [[NSMutableArray alloc] init];
    
    // Inicializa o parser de JSON
    
    SBJsonParser *jsonParser = [SBJsonParser new];
    
    // Carrega o NSData em um NSDictionary
    
    NSDictionary *json = (NSDictionary *) [jsonParser objectWithData:data];
    
    // Dictionary para todos os carros
    
    NSArray *jsonCarros = [[json objectForKey:@"carros"] objectForKey:@"carro"];
    
    // Para cada carro
    
    for (NSDictionary *dictCarro in jsonCarros) {
        
        // O valor de cada carro é lido de um NSDictionary
        
        Carro *c = [[Carro alloc] init];
        
        c.nome  = [dictCarro objectForKey:@"nome"];
        
        c.desc  = [dictCarro objectForKey:@"desc"];
        
        c.url_info = [dictCarro objectForKey:@"url_info"];
        
        c.url_foto = [dictCarro objectForKey:@"url_foto"];
        
        c.url_video = [dictCarro objectForKey:@"url_video"];
        
        c.latitude = [dictCarro objectForKey:@"latitude"];
        
        c.longitude = [dictCarro objectForKey:@"longitude"];
        
        [carros addObject:c];
        
    }
    
    // Retorna a lista de carros
    
    return carros;
    
}

@end
