//
//  HttpHelper.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/25/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface HttpHelper : NSObject
{
}
- (NSData *) doGet:(NSString *) url;
@end