//
//  ListaCarrosViewController_iPadViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 8/31/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "ListaCarrosViewController_iPad.h"
#import "Utils.h"

@implementation ListaCarrosViewController_iPad

@synthesize detalhesController;

// Executa ao selecionar a linha do TableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Carro selecionado
    NSInteger linha = indexPath.row;
    Carro *c = [self.carros objectAtIndex:linha];
    // Exibe o carro no controller da direita
    self.detalhesController.carro = c;
    [self.detalhesController exibeCarro];
}

- (void) transacaoAtualizarInterface {
    [super transacaoAtualizarInterface];
    // Exibe o primeiro carro na direita por padrão
    // Se está na vertical
    BOOL vertical = self.detalhesController.popoverController != nil;
    if (self.carros && [self.carros count] > 0 && !vertical) {
        Carro *c = [self.carros objectAtIndex:0];
        self.detalhesController.carro = c;
        NSLog(@"Carro %@", self.detalhesController.carro.nome);
        [self.detalhesController exibeCarro];

        [self.tableView reloadData];
    }
}

@end
