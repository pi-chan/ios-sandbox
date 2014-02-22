//
//  ViewController.m
//  FontAwesome
//
//  Created by Hiromasa OHNO.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import "ViewController.h"
#import <FontAwesome-iOS/NSString+FontAwesome.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.label.font = [UIFont fontWithName:@"FontAwesome" size:25];
    self.label.text = [NSString stringWithFormat:@"%@,%@,%@,%@,%@",
                       [NSString awesomeIcon:FaChevronLeft],
                       [NSString awesomeIcon:FaWrench],
                       [NSString awesomeIcon:FaFacebook],
                       [NSString awesomeIcon:FaGift],
                       [NSString awesomeIcon:FaPrint]
                       ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
