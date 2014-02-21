//
//  AdfurikunCpiView.h
//  SampleViewInterstitial
//
//  Created by tjk on 2013/09/30.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AdSupport/AdSupport.h>
#import "adfurikunView.h"


@protocol AdfurikunWallViewDelegate;
@class AdfurikunWallView;

enum {
    AdfurikunWallCloseTypeTouchUpButton = 100, // 「閉じる」ボタン押下時
    AdfurikunWallCloseTypeScheduleSkip,        // 表示頻度のため閉じる
    AdfurikunWallCloseTypeMaxDisplay,          // 最大表示回数のため閉じる
    AdfurikunWallCloseTypeNetworkFailed,       // ネットワークの未接続
    AdfurikunWallCloseTypeAdInfoFailed,        // 広告情報が取得出来ない
};



@interface AdfurikunWallView : AdfurikunBaseView

@property(nonatomic,retain) NSString *appID;
@property(nonatomic, assign) NSObject<AdfurikunWallViewDelegate> *delegate;
@property (nonatomic) int closeType;


-(void)startShowAd;
-(void)testModeEnable;
-(void)testModeDisable;
-(void)closeAd;

@end



@protocol AdfurikunWallViewDelegate
@optional
/**
 * 広告の表示/更新完了通知
 */
-(void)adfurikunViewDidFinishLoad:(AdfurikunWallView *)view;

/**
 * 広告情報の取得に失敗した場合
 *
 */
-(void)adfurikunViewAdFailed:(AdfurikunWallView *)view;

/**
 * 広告が閉じられた場合
 *
 */
-(void)adfurikunViewAdClose:(AdfurikunWallView *)view;


/**
 * ウォールから画面遷移をした場合。
 *
 */
-(void)adfurikunViewAdTapped:(AdfurikunWallView *)view;

@end
