//
//  MeuPrimeiroViewController.m
//  BemVindo
//
//  Created by Ricardo Lecheta on 9/21/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "MeuPrimeiroViewController.h"
#import "MeuSegundoViewController.h"

@implementation MeuPrimeiroViewController

- (BOOL)shouldAutorotate {
    return NO;
}

@synthesize segundo;

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidLoad {
    meuPrimeiroLabel.text = @"Tela iniciada com sucesso!";
    
    // Altera a imagem dinamicamente
    UIImage *image = [UIImage imageNamed:@"ferrari_ff.png"];
    imageView.image = image;

    // Customizando o botão Voltar
    UIBarButtonItem *btVoltar = [[UIBarButtonItem alloc] initWithTitle:@"Voltar" style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = btVoltar;
    
    // Titulo
    self.title = @"Primeiro Controller";
    
    // Aparëncia
//    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
//
    
//    float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
//    if (systemVersion >= 7.0)
//    {
//        self.navigationController.navigationBar.translucent = NO;
//    }
}

- (void)olaMundo:(id)sender {
    NSString *s = @"Olá ";
    
    if ([meuPrimeiroTextField.text isEqualToString:@""] ||
        
        [meuSegundoTextField.text isEqualToString:@""]) {
        
        UIAlertView *a = [[UIAlertView alloc] initWithTitle: @"Erro"
                          
                                                    message: @"Digite todos os campos" delegate: self cancelButtonTitle:@"Ok"
                          
                                          otherButtonTitles: nil];
        
        [a show];
    
        return;
        
    }
    
    // Nome
    
    s = [s stringByAppendingString:meuPrimeiroTextField.text];
    
    // Espaço
    
    s = [s stringByAppendingString:@" "];
    
    // Sobrenome
    
    s = [s stringByAppendingString:meuSegundoTextField.text];
    
    // Exibe a mensagem no label
    
    meuPrimeiroLabel.text = s;
    
    // Libera o foco para fechar o teclado virtual
    [meuPrimeiroTextField resignFirstResponder];
    [meuSegundoTextField resignFirstResponder];

    NSLog(@"%@", s);
    
    self.segundo = [[MeuSegundoViewController alloc] init];
    self.segundo.msg = s;
    
    
//    1) Windows
//    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    // Adicinoa a view do segundo controller na window
//    UIView *view = self.segundo.view;
//    [window addSubview:view];

//    2) Modal
    //segundo.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //[self presentViewController:self.segundo animated:YES completion:nil];

    // 3) Navigation
    [self.navigationController pushViewController:segundo animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == meuPrimeiroTextField) {
        
        // Navega para o próximo campo
        
        [meuSegundoTextField becomeFirstResponder];
        
        return YES;
        
    } else if (textField == meuSegundoTextField) {
        
        // Último campo executa o método olaMundo diretamente
        
        [self olaMundo:textField];
        
        return YES;
        
    }
    
    return NO;
    
}

- (IBAction)sliderValueChanged:(id)sender {
    
    UISlider *slider = sender;
    
    imageView.alpha = [slider value];
    
}

// Fecha o teclado virtual ao tocar em algum lugar da tela

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [meuPrimeiroTextField resignFirstResponder];
    [meuSegundoTextField resignFirstResponder];
    
}

@end
