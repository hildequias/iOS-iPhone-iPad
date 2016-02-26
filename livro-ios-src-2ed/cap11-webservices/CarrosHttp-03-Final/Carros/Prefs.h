//
//  Prefs.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/26/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Prefs : NSObject
+ (void) setString:(NSString *)valor chave:(NSString *)chave;
+ (NSString *) getString:(NSString *)chave;
+ (void) setInteger:(NSInteger)valor chave:(NSString *)chave;
+ (NSInteger) getInteger:(NSString *)chave;
@end