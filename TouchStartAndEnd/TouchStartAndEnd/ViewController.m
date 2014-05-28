//
//  ViewController.m
//  TouchStartAndEnd
//
//  Created by Hiromasa OHNO on 2014/05/28.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import "ViewController.h"
#import <YLGIFImage.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.gifImageView.hidden = YES;
    self.gifImageView.image = [YLGIFImage imageNamed:@"animation.gif"];
    
    self.momentarySwitch.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)on
{
    self.gifImageView.hidden = NO;
}

- (void)off
{
    self.gifImageView.hidden = YES;
}

@end
