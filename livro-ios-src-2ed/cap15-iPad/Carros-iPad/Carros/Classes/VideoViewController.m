//
//  VideoViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/26/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoUtil.h"

@implementation VideoViewController

@synthesize webView;
@synthesize carro;
@synthesize videoUtil;

/*
- (void)viewDidLoad {
    NSLog(@"%@ - Video: %@", self.carro.nome, self.carro.url_video);
    NSURL *url = [NSURL URLWithString:self.carro.url_video];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}*/

- (void)viewDidLoad {
    NSLog(@"%@ - Video: %@", self.carro.nome, self.carro.url_video);
    // Cria a URL
    NSURL *url = [NSURL URLWithString:self.carro.url_video];

    // Inicia o player de vídeo (classe utilitária)
    self.videoUtil = [[VideoUtil alloc] init];

    // Tela cheia
    [self.videoUtil playUrlFullScreen:url controller:self];

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
