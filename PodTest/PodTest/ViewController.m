//
//  ViewController.m
//  PodTest
//
//  Created by Hiromasa OHNO.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import "ViewController.h"
#import <adfurikunView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self addAdfurikunView];
}

- (void)addAdfurikunView
{
    float offset = 44;
   
    CGRect rect = CGRectMake(0, self.view.bounds.size.height-ADFRJS_VIEW_SIZE_320x50.height-offset,
                             ADFRJS_VIEW_SIZE_320x50.width, ADFRJS_VIEW_SIZE_320x50.height);
    AdfurikunView* adView = [[AdfurikunView alloc] initWithFrame:rect];
    
    adView.delegate = self;
    adView.appId = @"52688d0ebb323c741100000a";
    adView.transitionDulation = 0.5f;
    
    [adView testModeEnable];
    [adView startShowAd];
    
    [self.view addSubview:adView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
