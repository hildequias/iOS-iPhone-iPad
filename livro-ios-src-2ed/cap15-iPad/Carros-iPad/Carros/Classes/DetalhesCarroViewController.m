//
//  DetalhesViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "DetalhesCarroViewController.h"
#import "CarroDB.h"
#import "MapViewController.h"
#import "VideoViewController.h"
#import "Utils.h"

@implementation DetalhesCarroViewController

@synthesize carro;

@synthesize tDesc, img, imgHorizontal;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Atualiza informações do carro
    [self exibeCarro];
    
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

- (void)exibeCarro {
    // Título da Navigation Bar é o nome do carro
    self.title = carro.nome;
    // Atualiza o texto das views
    self.tDesc.text = carro.desc;
    // Foto: DownloadImageView
    self.img.url = carro.url_foto;
    self.imgHorizontal.url = carro.url_foto;
    
    if(popoverSplitVertical) {
        [popoverSplitVertical dismissPopoverAnimated:YES];
    }
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
	CarroDB *db = [[CarroDB alloc] init];
	[db abrir:@"carros"];
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
	[db fechar];
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
    
    BOOL iPhone = [Utils isIphone];
    if (iPhone) {
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
}

#pragma mark Métodos
- (IBAction) visualizarMapa:(id)sender {
	MapViewController *map = [[MapViewController alloc] init];
    map.carro = self.carro;
    
    if([Utils isIpad]) {
        UIButton *botao = (UIButton *) sender;
        popoverMapa = [[UIPopoverController alloc] initWithContentViewController:map];
        popoverMapa.popoverContentSize = CGSizeMake(600, 500);
        [popoverMapa presentPopoverFromRect:[botao bounds] inView:botao
               permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
    }
	else {
        [self.navigationController pushViewController:map animated:YES];
    }
}
- (IBAction) visualizarVideo:(id)sender {
    VideoViewController *controller = [[VideoViewController alloc] init];
    controller.carro = self.carro;
    [self.navigationController pushViewController: controller animated:YES];
}

#pragma mark - UISplitViewControllerDelegate
- (void)splitViewController: (UISplitViewController*)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem*)barButtonItem
       forPopoverController: (UIPopoverController*)pc {
    barButtonItem.title = @"Carros";
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    popoverSplitVertical = pc;
}
- (void)splitViewController: (UISplitViewController*)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
}

@end
