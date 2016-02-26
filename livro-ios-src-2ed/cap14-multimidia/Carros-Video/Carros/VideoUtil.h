//
//  VideoUtil.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/30/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoUtil : NSObject {
    // Player de vídeo
    MPMoviePlayerController *player;
    MPMoviePlayerViewController *playerViewController;
}

// Reproduz um vídeo (ex: .mp4) utilizando uma view como container para executar o player
- (void)playFile:(NSString *)file withView:(UIView *)view;
- (void)playUrl:(NSURL *)url withView:(UIView *)view;

// Reproduz um vídeo (ex: .mp4) em tela cheia
- (void)playFileFullScreen:(NSString *)file controller:(UIViewController *)controller;
- (void)playUrlFullScreen:(NSURL *)url controller:(UIViewController *)controller;

// Faz pause e stop
- (void) pause;
- (void) stop;
@end