//
//  ListaCarrosViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpAsyncHelperDelegate.h"

@interface ListaCarrosViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, HttpAsyncHelperDelegate>
// Tipo do carro selecionado
{
    // NSData para armazenar o retorno da requisição HTTP, que é o XML dos carros
    NSMutableData *retornoHttp;
}

@property (nonatomic, retain) NSString *tipo;

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *carros;

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *progress;

// Segment Control: Atualiza a lista de carros, conforme o tipo atual selecionado

- (IBAction)alterarTipo:(id)sender;
- (void) atualizar;

@end
