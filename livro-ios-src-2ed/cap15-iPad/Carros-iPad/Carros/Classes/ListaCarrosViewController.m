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
#import "Prefs.h"
#import "Utils.h"

@implementation ListaCarrosViewController

@synthesize tableView;
@synthesize carros;
@synthesize tipo;
@synthesize progress;

#pragma mark rotation
- (NSUInteger) supportedInterfaceOrientations {
    BOOL iPad = [Utils isIpad];
    if (iPad) {
        // iPad suporta todas as orientações
        return UIInterfaceOrientationMaskAll;
    } else {
        // iPhone: Apenas vertical
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)viewDidLoad {
    // ajusta o scroll da table view
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // Título
    self.title = @"Carros";
    
    // Protocolos DataSource e Delegate
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    // Busca os carros
    self.tipo = @"classicos";
    
    // Liga o cache por padrão
	cache = YES;
    
    // Insere o botão atualizar na navigation bar
	UIBarButtonItem *btAtualizar = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self
                                    action:@selector(atualizarOnline)];
	self.navigationItem.rightBarButtonItem = btAtualizar;

//    self.navigationController.navigationBar.tintColor = [UIColor redColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];

    // Recupera o tipo salvo nas preferências
	NSInteger idx = [Prefs getInteger:@"tipoIdx"];
	// Atualiza o índice no segment control
	[self.segmentControl setSelectedSegmentIndex:idx];
	self.tipo = [Prefs getString:@"tipoString"];
	if (tipo == nil) {
		self.tipo = @"classicos";
	}
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(!self.carros || [Utils isIphone]) {
        // No ipad vai aparecer varias vezes devido ao split/popover vertical
        [self atualizar];
    }
    
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
    // Salva o tipo nas preferências
	[Prefs setInteger:idx chave:@"tipoIdx"];
	[Prefs setString:tipo chave:@"tipoString"];

    
    [self atualizar];
    
}

#pragma mark Métodos
- (void) atualizarOnline {
	// Altera o flag para forçar a busca no servidor
	cache = NO;
	// Continua a lógica da mesma forma
	[self atualizar];
}
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
	carros = [CarroService getCarrosByTipo:self.tipo cache:cache];
    // zera o flag cache (o padrão é buscar no banco de dados)
	cache = YES;
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
