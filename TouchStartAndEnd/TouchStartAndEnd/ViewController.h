//
//  ViewController.h
//  TouchStartAndEnd
//
//  Created by Hiromasa OHNO on 2014/05/28.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YLImageView.h>
#import "MomentarySwitchView.h"

@interface ViewController : UIViewController<MomentarySwitchViewDelegate>

@property (weak, nonatomic) IBOutlet YLImageView *gifImageView;
@property (weak, nonatomic) IBOutlet MomentarySwitchView *momentarySwitch;
@end
