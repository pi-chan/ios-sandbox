//
//  ViewController.h
//  FBLogin
//
//  Created by Hiromasa OHNO on 2014/05/26.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK.h>

@interface ViewController : UIViewController<FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet FBLoginView *loginView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;
@end
