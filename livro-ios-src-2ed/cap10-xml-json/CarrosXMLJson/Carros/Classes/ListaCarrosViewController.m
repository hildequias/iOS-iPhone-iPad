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
@synthesize tipo;

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
    
    self.tipo = @"classicos";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self atualizar];
    
}

#pragma mark - Segment Control

- (IBAction) alterarTipo:(id)sender {
    
    UISegmentedControl *sc = (UISegmentedControl *) sender;
    
    // Recupera o índice selecionado
    
    int idx = sc.selectedSegmentIndex;
    
    switch (idx) {
            
        case 0:
            
            self.tipo = @"classicos";
            
            break;
            
        case 1:
            
            self.tipo = @"esportivos";
            
            break;
            
        case 2:
            
            self.tipo = @"luxo";
            
            break;
            
    }
    
    // Buscar os carros por tipo (classico, esportivo, luxo)
    
    [self atualizar];
    
}

#pragma mark Métodos

- (void) atualizar {
    
    // Busca os carros pelo tipo selecionado
    
    self.carros = [CarroService getCarrosByTipo:self.tipo];
    
    // Atualiza o TableView
    
    [self.tableView reloadData];
    
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
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:c.url_foto]];
//    UIImage *image = [[UIImage alloc] initWithData:data];
//    cell.imageView.image = image;
    
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
