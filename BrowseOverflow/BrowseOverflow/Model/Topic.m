//
//  Topic.m
//  BrowseOverflow
//
//  Created by Mobile6 on 9/3/15.
//  Copyright (c) 2015 Pixonsoft. All rights reserved.
//

#import "Topic.h"

@implementation Topic

- (id)initWithName:(NSString *)newName tag:(NSString *)newTag {
    
    if ((self = [super init])) {
        _name = [newName copy];
        _tag  = [newTag copy];
    }
    return self;
}

- (NSArray *) recentQuestions {
    return [NSArray array];
}

@end
