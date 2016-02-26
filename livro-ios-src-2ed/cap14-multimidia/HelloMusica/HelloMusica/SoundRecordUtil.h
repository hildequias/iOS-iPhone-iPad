//
//  SoundRecordUtil.h
//  HelloMusica
//
//  Created by Ricardo Lecheta on 8/31/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface SoundRecordUtil : NSObject <AVAudioRecorderDelegate> {
    AVAudioRecorder *soundRecorder;
}
// Inicia e para gravação
- (void) start:(NSURL *)url;
- (void) stop;
@end