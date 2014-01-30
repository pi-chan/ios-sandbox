//
//  ViewController.m
//  LapackSample
//
//  Created by Hiromasa OHNO.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import "ViewController.h"
#import <Accelerate/Accelerate.h>

const int M = 3;
const int N = 2;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
	__CLPK_complex A[M*N], b[M], work[M+N];
	long m=M,n=N,lda=M,ldb=M,info,ldw=M+N, nrhs=1;
	
	A[0].r = 1.0f,  A[3].r = 1.0f;
	A[1].r = 2.0f,  A[4].r = 1.0f;
	A[2].r = 3.0f,  A[5].r = 1.0f;
    
	b[0].r = 1.0f;
	b[1].r = 4.0f;
	b[2].r = 7.0f;
    
	cgels_("N",&m, &n, &nrhs, A, &lda, b, &ldb, work, &ldw, &info);
    NSLog(@"a=%f, b=%f\n",b[0].r,b[1].r);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
