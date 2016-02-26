//
//  ListaCarrosViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "ListaCarrosViewController.h"
#import "Alerta.h"
#import "CarroService.h"
#import "Carro.h"
#import "DetalhesCarroViewController.h"

@implementation ListaCarrosViewController

@synthesize tableView;
@synthesize carros;

- (NSUInteger) supportedInterfaceOrientations {
    // Delega para o view controller atual
    return UIInterfaceOrientationMaskPortrait;
    
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Título
    self.title = @"Carros";
    
    // Protocolos DataSource e Delegate
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    // Busca os carros
    self.carros = [CarroService getCarros];
}

#pragma mark - TableView

// Retorna a quantidade de linhas para criar a tabela, que é a quantidade de carros

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return carros.count;
    
}

// Retorna a célula que vai ser o conteúdo para a linha solicitada

- (UITableViewCell *)tableView:(UITableView *)tableView

         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Cria a célula desta linha da tabela
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    
    if (cell == nil) {
        
        // Faz cache da célula para evitar criar muitos objetos desncessários durante o scroll
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                
                                      reuseIdentifier:CellIdentifier];
        
    }
    
    // Carro selecionado
    NSInteger linha = indexPath.row;
    
    Carro *c = [carros objectAtIndex:linha];
    
    // Texto
    
    cell.textLabel.text = c.nome;
    
    // Imagem
    
    cell.imageView.image = [UIImage imageNamed:c.url_foto];
    
    return cell;
    
}

// Executa ao selecionar a linha do TableView

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Carro selecionado
    NSInteger linha = indexPath.row;
    Carro *c = [carros objectAtIndex:linha];
    
    // Cria a mensagem
//    NSString * msg = [NSString stringWithFormat:@"Selecionou o Carro %@",c.nome];
    // Exibe o alerta
//    [Alerta alerta:msg];
    
    // Navega para a tela de detalhes
    
    DetalhesCarroViewController *detalhes = [[DetalhesCarroViewController alloc] init];
    detalhes.carro = c;
    [self.navigationController pushViewController:detalhes animated:YES];
    
}

@end
