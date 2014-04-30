//
//  ViewController.m
//  AnimGif
//
//  Created by Hiromasa OHNO on 2014/04/30.
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
    
    self.imageView.image = [UIImage imageNamed:@"sample.gif"];
    self.gifImageView.image = [YLGIFImage imageNamed:@"sample.gif"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
