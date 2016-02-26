//
//  VideoUtil.m
//  Carros
//
//  Created by Ricardo Lecheta on 8/30/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "VideoUtil.h"
#import "Alerta.h"

@implementation VideoUtil

// Reproduz o vídeo com um player utilizando uma view como container
- (void)playFile:(NSString *)file withView:(UIView *)view {
    // Converte o nome do arquivo em NSURL
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:nil];
    if (path) {
        NSURL *url = [NSURL fileURLWithPath:path];
        NSLog(@"URL %@", url);
        [self playUrl:url withView:view];
    }
}

// Reproduz o vídeo com um player utilizando uma view como container
- (void)playUrl:(NSURL *)url withView:(UIView *)view {
    @try {
        // Cria o componente que gerencia o video
        if (!player) {
            player = [[MPMoviePlayerController alloc] initWithContentURL: url];
            [player prepareToPlay];
            // Configura a view
            [player.view setFrame: view.bounds];
            [view addSubview: player.view];
        }
        // Inicia o video
        [player play];

    }
    @catch (NSException *exception) {
        NSLog(@"Erro %@", [exception description]);
    }
}
// Reproduz o vídeo em tela cheia
- (void)playFileFullScreen:(NSString *)file controller:(UIViewController *)controller {
    // Converte o nome do arquivo em NSURL
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];

    [self playUrlFullScreen:url controller:controller];
}
// Reproduz o vídeo em tela cheia
- (void)playUrlFullScreen:(NSURL *)url controller:(UIViewController *)controller {
    @try {
        // Cria o controller especializado em reproduzir video
        playerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];

        // Exibe o controller como modal
        [controller presentMoviePlayerViewControllerAnimated:playerViewController];
    }
    @catch (NSException *exception) {
        NSLog(@"Erro %@", [exception description]);
    }
}
- (void) pause {
    [player pause];
}
- (void) stop {
    [player stop];
    player = nil;
}

@end