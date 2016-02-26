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
{
    // Se a busca deve ser feita o banco de dados ou online
	BOOL cache;
}

// Tipo do carro selecionado
@property (nonatomic, retain) NSString *tipo;

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *progress;

@property (nonatomic, strong) NSMutableArray *carros;

// Segmented Control
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentControl;

// Segment Control: Atualiza a lista de carros, conforme o tipo atual selecionado

- (IBAction)alterarTipo:(id)sender;
- (void) atualizarOnline;
- (void) atualizar;

@end
