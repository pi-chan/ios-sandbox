//
//  MomentarySwitchView.m
//  TouchStartAndEnd
//
//  Created by Hiromasa OHNO on 2014/05/28.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import "MomentarySwitchView.h"

@implementation MomentarySwitchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"begin");
    if(self.delegate){
        [self.delegate on];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"end");
    if(self.delegate){
        [self.delegate off];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"cancel");
    if(self.delegate){
        [self.delegate off];
    }
}

@end
