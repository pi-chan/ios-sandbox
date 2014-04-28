//
//  CustomButton.m
//  CustomButton
//
//  Created by Hiromasa OHNO on 2014/04/28.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

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

- (void)awakeFromNib
{
    self.layer.cornerRadius = self.cornerRadius;
    self.layer.borderWidth  = self.borderWidth ;
}

@end
