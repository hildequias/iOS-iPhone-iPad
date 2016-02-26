//
//  SoundUtil.h
//  HelloMusica
//
//  Created by Ricardo Lecheta on 8/31/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface SoundUtil : NSObject <AVAudioPlayerDelegate> {
    AVAudioPlayer *player;
}
- (IBAction)playFile :(NSString *)arquivo;
- (IBAction)playUrl :(NSURL *)url;
- (IBAction)pause;
- (IBAction)stop;
@end