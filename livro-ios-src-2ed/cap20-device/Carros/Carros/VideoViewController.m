//
//  VideoViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 8/30/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

@synthesize webView, carro;

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"Carro %@ - Video: %@", self.carro.nome, self.carro.url_video);

    NSURL *url = [NSURL URLWithString:self.carro.url_video];
    
    //    NSURLRequest* request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
    
    // Inicia o player de vídeo (classe utilitária)
    self.videoUtil = [[VideoUtil alloc] init];
    
    // Reproduz o vídeo sobre uma view de marcação
    [self.videoUtil playUrl:url withView:self.webView];

    // Fullsceen
//    [self.videoUtil playUrlFullScreen:url controller:self];

    // Teste Youtube
//    url = [NSURL URLWithString:@"http://www.youtube.com/embed/IqxOYqK2SVg"];
//    [[UIApplication sharedApplication] openURL:url];
    
//    url = [NSURL URLWithString:@"http://www.livroiphone.com.br/carros/esportivos/ferrari_ff.mp4"];
//    [[UIApplication sharedApplication] openURL:url];
    
    // Adiciona a notificação para quando o vídeo encerrar
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoFim)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    // Adiciona a notificação do botão Done
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoFim)
                                                 name:MPMoviePlayerDidExitFullscreenNotification object:nil];
}
- (void) videoFim {
    NSLog(@"Fim do Video");
    // Vamos aproveitar e fechar este controller porque o vídeo já terminou
    [self.navigationController popViewControllerAnimated:YES];
}

@end
