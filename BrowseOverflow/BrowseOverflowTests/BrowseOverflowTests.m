//
//  BrowseOverflowTests.m
//  BrowseOverflowTests
//
//  Created by Mobile6 on 9/3/15.
//  Copyright (c) 2015 Pixonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Topic.h"

@interface BrowseOverflowTests : XCTestCase {
    Topic *topic;
}

@end

@implementation BrowseOverflowTests

- (void)setUp {
    [super setUp];
    
    topic = [[Topic alloc] initWithName:@"iphone" tag:@"iphone"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    topic = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void) testThatTopicExists {
    
    XCTAssertNotNil(topic,
                   @"should be able to create a Topic instance");
}

- (void) testThatTopicCanBeNamed {
    XCTAssertEqualObjects(topic.name, @"iphone", @"the Topic should have the name I gave it");
}

- (void) testThatTopicHasATag {
    XCTAssertEqualObjects(topic.tag, @"iphone", @"the Topic should have the tag I gave it");
}

- (void) testForAListOfQuestions {
    XCTAssertTrue([[topic recentQuestions] isKindOfClass: [NSArray class]], @"Topics should provide a list of recent questions");
}

@end
