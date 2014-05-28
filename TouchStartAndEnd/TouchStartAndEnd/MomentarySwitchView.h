//
//  MomentarySwitchView.h
//  TouchStartAndEnd
//
//  Created by Hiromasa OHNO on 2014/05/28.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MomentarySwitchViewDelegate <NSObject>

- (void)on;
- (void)off;

@end

@interface MomentarySwitchView : UIView

@property (nonatomic, weak) id<MomentarySwitchViewDelegate> delegate;

@end
