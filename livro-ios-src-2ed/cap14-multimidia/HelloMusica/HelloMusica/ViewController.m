//
//  ViewController.m
//  HelloMusica
//
//  Created by Ricardo Lecheta on 8/31/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "ViewController.h"
#import "SoundUtil.h"

@implementation ViewController

@synthesize sound;
@synthesize soundRecord;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Cria a classe utilitária
    self.sound = [[SoundUtil alloc] init];
}

#pragma mark play
- (void)play {
    // Toca a música thai.mp3
    [self.sound playFile:@"thai.mp3"];
}
- (void)pause {
    // Pause na música
    [self.sound pause];
}
- (void)stop {
    // Para a música
    [self.sound stop];
}

#pragma mark record
- (void)startRecord {
    // Cria o arquivo para gravar
    NSString *tempDir = NSTemporaryDirectory();
    NSString *path = [tempDir stringByAppendingString: @"musica.caf"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath: path];
    // Inicia a gravação
    self.soundRecord = [[SoundRecordUtil alloc] init];
    [self.soundRecord start:url];
    NSLog(@"start");
}
- (void)stopRecord {
    // Para a gravação
    [self.soundRecord stop];
    NSLog(@"stop");
}
- (void)playRecord {
    // Toca a música gravada
    NSString *tempDir = NSTemporaryDirectory();
    // Caminho do arquivo de destino para gravar
    NSString *path = [tempDir stringByAppendingString: @"musica.caf"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath: path];
    NSLog(@"url %@", url);
    self.sound = [[SoundUtil alloc] init];
    [self.sound playUrl:url];
}

@end
