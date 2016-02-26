//
//  ListaCarrosViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 8/18/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "ListaCarrosViewController.h"
#import "Alerta.h"
#import "CarroService.h"
#import "Carro.h"
#import "DetalhesCarroViewController.h"
#import "CarroCell.h"
#import "HttpAsyncHelper.h"
#import "TransacaoUtil.h"
#import "Prefs.h"
#import "Utils.h"

@implementation ListaCarrosViewController

@synthesize tableView, carros, tipo, progress, segmentControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Título
    self.title = @"Carros";
    
    // Para a view ficar posicionada abaixo do navigation controller
//    self.edgesForExtendedLayout = UIExtendedEdgeNone;
//    self.extendedLayoutIncludesOpaqueBars = NO;
//    self.automaticallyAdjustsScrollViewInsets = NO;

    // Protocolos DataSource e Delegate
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
 
    // Insere o botão atualizar na navigation bar
    UIBarButtonItem *btAtualizar = [[UIBarButtonItem alloc]
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self
                                     action:@selector(atualizar)];
    self.navigationItem.rightBarButtonItem = btAtualizar;
    
    // Recupera o tipo salvo nas preferências
    int idx = [Prefs getInteger:@"tipoIdx"];
    // Atualiza o índice no segment control
    [self.segmentControl setSelectedSegmentIndex:idx];
    self.tipo = [Prefs getString:@"tipoString"];
    if (tipo == nil) {
        self.tipo = @"classicos";
    }
    
    // Busca os carros
//    [self atualizar];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Sempre busca os carros ao exibir a tela
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
    
    // Salva o tipo nas preferências
    [Prefs setInteger:idx chave:@"tipoIdx"];
    [Prefs setString:tipo chave:@"tipoString"];
    
    // Buscar os carros por tipo (classico, esportivo, luxo)
    [self atualizar];
}
#pragma mark Métodos
- (void) atualizar {
    tableView.hidden = YES;
    // Inicia a animação
    [progress startAnimating];
    // Cria o NSMutableData para receber o retorno (XML ou JSON)
    retornoHttp = [NSMutableData data];
    // Cria a URL correta
    NSString *url = [NSString stringWithFormat:URL_CARROS, tipo];
    NSLog(@"URL %@", url);
    // Inicia a request HTTP, disparando de forma assíncrona
    // O delegate:self indica que vamos receber os eventos nessa classe
    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    //[NSURLConnection connectionWithRequest:request delegate:self];
    
    // Cria a classe HttpAsyncHelper
//    HttpAsyncHelper *http = [[HttpAsyncHelper alloc] init];
    // Informa o delegate para receber o resultado (self é a própria classe)
//    [http setDelegate:self];
    // Dispara a requisição
//    [http doGet:url];

    // Dispara a transação, informando o delegate = self
    TransacaoUtil *tm = [[TransacaoUtil alloc] init];
    [tm iniciarTransacao:self];
}

#pragma mark - TableView
// Retorna a quantidade de linhas para criar a tabela, que é a quantidade de carros
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [carros count];
}
// Retorna a célula que vai ser o conteúdo para a linha solicitada
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Cria a célula desta linha da tabela
    static NSString *CellIdentifier = @"CarroCell";
    CarroCell *cell = (CarroCell*) [self.tableView
                                    dequeueReusableCellWithIdentifier: CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CarroCell" owner:self options:nil]
                objectAtIndex:0];
    }

    // Número da linha (0, 1, 2, 3, 4 etc.)
    NSInteger linha = indexPath.row;
    
    Carro *c = [carros objectAtIndex:linha];
    
    // Descrição
    cell.cellDesc.text = c.nome;
    // Foto
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:c.url_foto]];
//    UIImage *image = [[UIImage alloc] initWithData:data];
//    cell.cellImg.image = image;
    
    // Foto: Cria os parâmetros, que são o UIImageView e a URL que possui a imagem
//    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:cell.cellImg,
//                            @"imageView", c.url_foto, @"url", nil];
    // Executa o método downloadImg em background
//    [self performSelectorInBackground:@selector(downloadImg:) withObject:params];
    
    cell.cellImg.url = c.url_foto;
    
    return cell;
}

// Executa ao selecionar a linha do TableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Recupera o índice da linha selecionada
    NSInteger linha = indexPath.row;
   
    Carro *c = [carros objectAtIndex:linha];
    // Cria a mensagem
    //NSString * msg = [NSString stringWithFormat:@"Selecionou o Carro %@",c.nome];
    // Exibe o alerta
    //[Alerta alerta:msg];

    DetalhesCarroViewController *detalhes = [[DetalhesCarroViewController alloc] init];
    detalhes.carro = c;
    [self.navigationController pushViewController:detalhes animated:YES];
}

#pragma mark rotation iOS 5
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    BOOL iPad = [Utils isIpad];
    if (iPad) {
        // iPad suporta todas as orientações
        return YES;
    } else {
        // iPhone: Apenas vertical
        return UIInterfaceOrientationPortrait;
    }
}
#pragma mark rotation iOS 6
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


#pragma mark - Transação
// Este método vai executar em uma thread separada
- (void) transacaoExecutar {
    // A vantagem está aqui neste método que pode ser chamado em uma linha apenas
    // O que ele faz é por sua conta. Pode ser que os carros estejam no banco de dados local,
    // ou na internet
    carros = [CarroService getCarrosByTipo:self.tipo cache:YES];
}
// Este método vai executar na thread principal - UI Thread
- (void) transacaoAtualizarInterface {
    [progress stopAnimating];
    if (carros && [carros count] > 0) {
        self.tableView.hidden = NO;
        [self.tableView reloadData];
    } else {
        [Alerta alerta:@"Nenhum carro encontrado."];
    }
}

@end
