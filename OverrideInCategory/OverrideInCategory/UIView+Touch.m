//
//  UIView+Touch.m
//  OverrideInCategory
//
//  Created by Hiromasa OHNO on 2014/05/30.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import "UIView+Touch.h"

@implementation UIView (Touch)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan:[%p]", self);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded:[%p]", self);
}

@end
