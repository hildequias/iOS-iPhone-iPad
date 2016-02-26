//
//  ListaCarrosViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/18/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpAsyncHelperDelegate.h"
#import "Transacao.h"
@interface ListaCarrosViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, /*NSURLConnectionDataDelegate, HttpAsyncHelperDelegate,*/ Transacao>
{
    // NSData para armazenar o retorno da requisição HTTP, que é o XML dos carros
    NSMutableData *retornoHttp;
    
    BOOL cache;
    
}

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *progress;

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *carros;

// Tipo do carro selecionado
@property (nonatomic, retain) NSString *tipo;

// Busca os carros pelo tipo selecionado e exibe no TableView
- (void)atualizar;
// Segment Control: Atualiza a lista de carros, conforme o tipo atual selecionado
- (IBAction)alterarTipo:(id)sender;

// Este método será executado em background por uma thread
//- (void) downloadImg:(NSDictionary *)params;
// Este método será executado na thread principal, para atualizar a interface
//- (void) showImg:(NSDictionary *)params;

// Segmented Control
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentControl;

@end
