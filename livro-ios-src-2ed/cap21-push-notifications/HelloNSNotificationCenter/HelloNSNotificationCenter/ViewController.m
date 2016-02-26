//
//  ViewController.m
//  HelloNSNotificationCenter
//
//  Created by Ricardo Lecheta on 9/15/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Se registra para receber mensagens do tipo MINHA_NOTIFICACAO
    [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(recebeNotification:)
                                            name:@"MINHA_NOTIFICACAO"
                                            object:nil];
}

- (void)viewDidUnload {
    // Remove o registro para parar de receber eventos
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                 name:@"MINHA_NOTIFICACAO"
                                               object:nil];

}

- (void)recebeNotification:(NSNotification *)notification {
    // Recebe a notificação
    NSLog(@">> recebeNotification %@", [notification object]);
    
}

- (IBAction) onTouchEnviarNotificacao:(id)sender {
    // Teste de Notification
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MINHA_NOTIFICACAO" object:@"Ricardo"];
}

@end
