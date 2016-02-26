//
//  NSString+Utils.m
//  OlaObjectiveC
//
//  Created by Ricardo Lecheta on 11/19/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

- (NSString *)toString {
    // Retorna uma string formatada com o texto e o tamanho
    NSString *s = [NSString stringWithFormat:@"%@ (%lu)", [self description], [self length]];
    return s;
}

@end
