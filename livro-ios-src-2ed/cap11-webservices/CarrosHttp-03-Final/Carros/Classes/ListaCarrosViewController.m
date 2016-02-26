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
#import "CarroCell.h"
#import "TransacaoUtil.h"

@implementation ListaCarrosViewController

@synthesize tableView;
@synthesize carros;
@synthesize tipo;
@synthesize progress;

//- (NSUInteger) supportedInterfaceOrientations {
//    // Delega para o view controller atual
//    return UIInterfaceOrientationMaskPortrait;
//    
//}

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

    // ajusta o scroll da table view
    self.automaticallyAdjustsScrollViewInsets = NO;

    // Insere o botão atualizar na navigation bar
	UIBarButtonItem *btAtualizar = [[UIBarButtonItem alloc]
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self
                                     action:@selector(atualizar)];
	self.navigationItem.rightBarButtonItem = btAtualizar;

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
    
    // Inicia a animação
	[progress startAnimating];
    
    tableView.hidden = YES;

	// Dispara a transação, informando o delegate = self
	TransacaoUtil *tm = [[TransacaoUtil alloc] init];
	[tm iniciarTransacao:self];
    
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
    
    CarroCell *cell = (CarroCell*) [self.tableView
                                    
                                    dequeueReusableCellWithIdentifier: CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CarroCell" owner:self options:nil]
                
                objectAtIndex:0];
        
    }
    
    // Carro selecionado
    
    NSInteger linha = indexPath.row;
    
    Carro *carro = [carros objectAtIndex:linha];
    
    // Descrição
    
    cell.cellDesc.text = carro.nome;
    cell.cellImg.url = carro.url_foto;
    
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

#pragma mark - Transação
// Este método vai executar em uma thread separada
- (void) transacaoExecutar {
	// A vantagem está aqui neste método que pode ser chamado em uma linha apenas
	// O que ele faz é por sua conta. Pode ser que os carros estejam no banco de dados local,
	// ou na internet
	carros = [CarroService getCarrosByTipo:self.tipo];
}
// Este método vai executar na thread principal - UI Thread
- (void) transacaoAtualizarInterface {
	[progress stopAnimating];
	if (carros && [carros count] > 0) {
		[self.tableView reloadData];
	} else {
		[Alerta alerta:@"Nenhum carro encontrado."];
	}
    
    tableView.hidden = NO;
}

@end
