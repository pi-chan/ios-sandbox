//
//  CaptureScreenshotsTests.m
//  CaptureScreenshotsTests
//
//  Created by Hiromasa OHNO.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KIF.h>

@interface CaptureScreenshotsTests : KIFTestCase

@end

@implementation CaptureScreenshotsTests


- (void)captureScreen:(NSString*)name
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* dir = [paths objectAtIndex:0];
    
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (UIWindow* win in [[UIApplication sharedApplication] windows]) {
        [win.layer renderInContext:context];
    }
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [UIImagePNGRepresentation(image) writeToFile:[dir stringByAppendingPathComponent:name] atomically:YES];
}

- (void)test
{
    [self captureScreen:@"first_view.png"];
    [tester waitForViewWithAccessibilityLabel:@"ToSecondView"];
    [tester tapViewWithAccessibilityLabel:@"ToSecondView"];
    [self captureScreen:@"second_view.png"];
    [tester waitForViewWithAccessibilityLabel:@"ToThirdView"];
    [tester tapViewWithAccessibilityLabel:@"ToThirdView"];
    [self captureScreen:@"third_view.png"];
}

@end
