//
//  ViewController.m
//  CIDetectorExample
//
//  Created by Hiromasa OHNO.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:nil
                                              options:@{CIDetectorAccuracy: CIDetectorAccuracyHigh}];

    UIImage* uiimage = [UIImage imageNamed:@"photo.png"];
    CIImage* image = [CIImage imageWithCGImage:uiimage.CGImage];
    NSArray *features = [detector featuresInImage:image
                                          options:@{ CIDetectorSmile:@YES,
                                                     CIDetectorEyeBlink:@YES,
                                                     CIDetectorImageOrientation:[NSNumber numberWithInt:1]}];
    
    for(CIFaceFeature* face in features){
        NSLog(@"Face Bounds:%@", NSStringFromCGRect(face.bounds));
        NSLog(@"Left Eye Pos:%@", NSStringFromCGPoint(face.leftEyePosition));
        NSLog(@"Right Eye Pos:%@", NSStringFromCGPoint(face.rightEyePosition));
        NSLog(@"Mouth Pos:%@", NSStringFromCGPoint(face.mouthPosition));
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
