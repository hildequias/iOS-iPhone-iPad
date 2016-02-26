//
//  ListaCarrosViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transacao.h"

@interface ListaCarrosViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, Transacao>
// Tipo do carro selecionado

@property (nonatomic, retain) NSString *tipo;

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *progress;

@property (nonatomic, strong) NSMutableArray *carros;



// Segment Control: Atualiza a lista de carros, conforme o tipo atual selecionado

- (IBAction)alterarTipo:(id)sender;
- (void) atualizar;

@end
