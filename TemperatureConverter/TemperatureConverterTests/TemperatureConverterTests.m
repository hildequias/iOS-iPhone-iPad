//
//  TemperatureConverterTests.m
//  TemperatureConverterTests
//
//  Created by Mobile6 on 8/10/15.
//  Copyright (c) 2015 Pixonsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface TemperatureConverterTests : XCTestCase

@end

@implementation TemperatureConverterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test fail case.
    //XCTFail(@"Unit tests are not implemented yet in Temperature_ConverterTests");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void) testThatOCUnitWorks {
    XCTAssertTrue(YES, @"OCUnit should pass this test.");
}

@end
