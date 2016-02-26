//
//  HttpAsyncHelperDelegate.h
//  Carros
//
//  Created by Ricardo Lecheta on 11/20/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HttpAsyncHelperDelegate <NSObject>

@required

// OK
- (void)requestEndWithData:(NSData *)data;
// Erro
- (void)requestEndWithError:(NSError *)error;
@end