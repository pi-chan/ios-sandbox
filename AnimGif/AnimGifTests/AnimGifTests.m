//
//  AnimGifTests.m
//  AnimGifTests
//
//  Created by Hiromasa OHNO.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AnimGifTests : XCTestCase

@end

@implementation AnimGifTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    CFRunLoopRef rl = CFRunLoopGetCurrent();
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://xoyip.hatenablog.com/"]];
    NSOperationQueue *queue = [NSOperationQueue new];
    [NSURLConnection sendAsynchronousRequest:req queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSLog(@"complete");
        XCTAssert(NO);
        CFRunLoopStop(rl);
    }];
    
    NSLog(@"test ended");
    XCTAssert(YES);
    
    CFRunLoopRun();
}

@end
