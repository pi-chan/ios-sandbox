//
//  ViewController.h
//  TouchStartAndEnd
//
//  Created by Hiromasa OHNO on 2014/05/28.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <UIView+CFPressHoldButton.h>

@interface ViewController : UIViewController<CFPressHoldButtonDelegate, AVCaptureFileOutputRecordingDelegate>
@property (weak, nonatomic) IBOutlet UIView *pressHoldButton;

@end
