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

#define URL_CARROS @"http://www.livroiphone.com.br/carros/carros_%@.xml"

@implementation ListaCarrosViewController

@synthesize tableView;
@synthesize carros;
@synthesize tipo;
@synthesize progress;

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
    
    // Scroll do UITableView
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // Título
    self.title = @"Carros";
    
    // Protocolos DataSource e Delegate
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    // Insere o botão atualizar na navigation bar
    UIBarButtonItem *btAtualizar = [[UIBarButtonItem alloc]
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self
                                     action:@selector(atualizar)];
    self.navigationItem.rightBarButtonItem = btAtualizar;
    
    // Busca os carros
    self.tipo = @"classicos";
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
    // Cria o NSMutableData para receber o retorno (XML ou JSON)

    // Lembre-se que os métodos retain e release não precisam ser chamados no projeto com ARC
    retornoHttp = [NSMutableData data];
    
    // Cria a URL correta
    NSString *url = [NSString stringWithFormat:URL_CARROS, tipo];
    
    NSLog(@"URL %@", url);

    // Inicia a request HTTP, disparando de forma assíncrona
    // O delegate:self indica que vamos receber os eventos nessa classe
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
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

#pragma mark NSURLConnectionDataDelegate
// Recebeu uma resposta do servidor
- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response {
    [retornoHttp setLength:0];
}
// Recebeu dados, então vamos adicionar no NSData
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Vai adicionando o conteúdo do XML ou JSON no buffer
    [retornoHttp appendData:data];
}
// Ocorreu um erro
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Erro ao fazer a requisição %@", [error description]);
    [Alerta alerta:@"Servidor temporariamente indisponivel, por favor tente mais tarde"];
    [progress stopAnimating];
}
// Terminou a requisição
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // Para a animação
    [progress stopAnimating];
    // Faz o parser
    if (retornoHttp && [retornoHttp length] > 0) {
        carros = [CarroService parserXML_DOM:retornoHttp];
    }
    // Se a lista de carros está ok
    if (carros && [carros count] > 0) {
        [self.tableView reloadData];
    } else {
        [Alerta alerta:@"Nenhum carro encontrado."];
    }
}

@end
