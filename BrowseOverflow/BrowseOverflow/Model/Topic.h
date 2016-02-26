//
//  Topic.h
//  BrowseOverflow
//
//  Created by Mobile6 on 9/3/15.
//  Copyright (c) 2015 Pixonsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Topic : NSObject

@property (readonly) NSString *name;
@property (readonly) NSString *tag;

- (id)initWithName:(NSString *)newName tag:(NSString *)tag;
- (NSArray *) recentQuestions;

@end
