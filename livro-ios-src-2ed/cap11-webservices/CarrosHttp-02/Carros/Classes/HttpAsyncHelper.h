//
//  HttpAsyncHelper.h
//  Carros
//
//  Created by Ricardo Lecheta on 11/20/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpAsyncHelperDelegate.h"

@interface HttpAsyncHelper : NSObject <NSURLConnectionDataDelegate> {
    // Retorno do HTTP
    NSMutableData *retornoHttp;
    id <HttpAsyncHelperDelegate> delegate;
}

@property (retain) id delegate;
- (void) doGet:(NSString *) url;

@end