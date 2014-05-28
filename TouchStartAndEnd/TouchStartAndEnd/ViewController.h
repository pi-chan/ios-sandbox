//
//  ViewController.h
//  TouchStartAndEnd
//
//  Created by Hiromasa OHNO on 2014/05/28.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MomentarySwitchView.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<MomentarySwitchViewDelegate, AVCaptureFileOutputRecordingDelegate>

@property (weak, nonatomic) IBOutlet MomentarySwitchView *momentarySwitch;
@end
