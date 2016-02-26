//
//  QuestionTests.m
//  BrowseOverflow
//
//  Created by Mobile6 on 9/3/15.
//  Copyright (c) 2015 Pixonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Questions.h"

@interface QuestionTests : XCTestCase

@end

@implementation QuestionTests {
    Questions *question;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    question = [[Questions alloc] init];
    question.date   = [NSDate distantPast];
    question.title  = @"Do iPhones also dream of electric sheep?";
    question.score  = 42;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    question = nil;
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

- (void) testQuestionHasDate {
    
    NSDate *testDate    = [NSDate distantPast];
    question.date       = testDate;
    
    XCTAssertEqualObjects(question.date, testDate, @"Question needs to provide its date");
}

- (void) testQuestionsKeepScore {
    XCTAssertEqual(question.score, 42, @"Questions need a numeric score");
}

- (void) testQuestionHasTitle {
    XCTAssertEqualObjects(question.title, @"Do iPhones also dream of electric sheep?", @"Question should know its title");
}
@end
