//
//  DetalhesViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "DetalhesCarroViewController.h"
#import "CarroDBCoreData.h"

@implementation DetalhesCarroViewController

@synthesize carro;

@synthesize tDesc, img, imgHorizontal;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Título da Navigation Bar é o nome do carro
    
    self.title = carro.nome;
    
    // Atualiza o texto das views
    
    self.tDesc.text = carro.desc;
    
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:carro.url_foto]];
//    UIImage *image = [[UIImage alloc] initWithData:data];
    
    self.img.url = carro.url_foto;
   
    self.imgHorizontal.url = carro.url_foto;
    
    UIDeviceOrientation o = [[UIDevice currentDevice] orientation];
    
    if (o == UIInterfaceOrientationLandscapeLeft ||
        o == UIInterfaceOrientationLandscapeRight) {

        // Executa o codigo para Horizontal
        [self willRotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft duration:1];
        
    }
    
    // Insere o botão editar na navigation bar
    UIBarButtonItem *btEditar = [[UIBarButtonItem alloc] initWithTitle:@"Editar"
                                                                  style:UIBarButtonItemStyleBordered target:self action:@selector(editar)];
	self.navigationItem.rightBarButtonItem = btEditar;
}
#pragma mark - Editar ou Excluir
- (void)editar {
	// Exibe um alerta para Salvar ou Excluir o carro
	UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Salvar ou Excluir"
                                                     message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"Salvar",
                           @"Excluir", nil];
	[alerta setAlertViewStyle:UIAlertViewStylePlainTextInput];
	[alerta show];
	// Preenche o campo de texto com o nome do carro
	[[alerta textFieldAtIndex:0] setText:carro.nome];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	// Abre o banco de dados
	CarroDBCoreData *db = [[CarroDBCoreData alloc] init];
//	[db abrir:@"carros"];
	if (buttonIndex == 0) {
		// Salva o carro
		NSString *novoNome = [[alertView textFieldAtIndex:0] text];
		carro.nome = novoNome;
		[db salvar:carro];
		// Atualiza o titulo do controller
		self.title = carro.nome;
	} else if (buttonIndex == 1) {
		// Deleta o carro
		[db deletar:carro];
		// Fecha esta tela
		[self.navigationController popViewControllerAnimated:YES]; // Salvar: atualiza o
        // nome do carro com o texto digitado
	}
	// Fecha o banco de dados
//	[db fechar];
}

#pragma mark rotation iOS 6

- (BOOL)prefersStatusBarHidden
{
    // Se a view for a horizontal pode esconder a status bar
    return self.view == self.viewHorizontal;
}

- (NSUInteger) supportedInterfaceOrientations {
    // Todas menos de ponta cabeça
    return UIInterfaceOrientationMaskAllButUpsideDown;
    
}

#pragma mark rotation
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration {
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        // Se for horizontal
        self.view = self.viewHorizontal;
        
        // Horizontal: Esconde tudo
        self.tabBarController.tabBar.hidden = YES;
        self.navigationController.navigationBar.hidden = YES;
        
        [self setNeedsStatusBarAppearanceUpdate];
    } else {
        // Se for vertical
        self.view = self.viewVertical;
        
        // Vertical: Exibe a tab bar e navigation bar
        self.tabBarController.tabBar.hidden = NO;
        self.navigationController.navigationBar.hidden = NO;
        
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

@end
