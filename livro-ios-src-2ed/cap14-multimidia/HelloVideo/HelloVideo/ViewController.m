//
//  ViewController.m
//  HelloVideo
//
//  Created by Ricardo Lecheta on 8/31/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize videoUtil;
@synthesize videoView;

- (void)viewDidLoad {
    // Cria a classe utilitária
    self.videoUtil = [[VideoUtil alloc] init];
}

- (void)play {
    NSLog(@"play %@", self.videoView);
    // Reproduz o vídeo (vamos deixar a URL fixa para testar)
    NSURL *url = [NSURL
                  URLWithString:@"http://www.livroiphone.com.br/carros/esportivos/ferrari_ff.mp4"];
    [self.videoUtil playUrl:url withView:self.videoView];
}
- (void)pause {
    // Pause no vídeo
    [self.videoUtil pause];
}

- (void)stop {
    // Para o vídeo
    [self.videoUtil stop];
}

@end
