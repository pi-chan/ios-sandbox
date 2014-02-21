//
//  AdfurikunView.h
//  adfurikunsdk
//
//  Copyright (c) Terajima Joho Kikaku Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AdSupport/AdSupport.h>
#import "adfurikunView.h"


@protocol AdfurikunPopupViewDelegate;
@class AdfurikunPopupView;

#define ADFRJS_POPUPVIEW_SIZE_300x360 CGSizeMake( 300, 360 )
enum {
    AdfurikunPopUpCloseTypeTouchUpButton = 100, // 「閉じる」ボタン押下時
    AdfurikunPopUpCloseTypeScheduleSkip,        // 表示頻度のため閉じる
    AdfurikunPopUpCloseTypeMaxDisplay,          // 最大表示回数のため閉じる
    AdfurikunPopUpCloseTypeNetworkFailed,       // ネットワークの未接続
    AdfurikunPopUpCloseTypeAdInfoFailed,        // 広告情報が取得出来ない
};


@interface AdfurikunPopupView : AdfurikunBaseView


@property(nonatomic,retain) NSString *appID;
@property(nonatomic, assign) NSObject<AdfurikunPopupViewDelegate> *delegate;
@property (nonatomic) int closeType;


//@property
/**
 * 広告表示を開始する。
 */
-(void)startShowAd;

/**
 * アドネットワークキーを表示する際等に
 *
 */
-(void)testModeEnable;
-(void)testModeDisable;

/**
 * スケジュールの設定
 * n回に1回表示するタイミング設定（1にすると毎回表示されます）
 * デフォルト 1
 */
-(void) setSchedule:(int)schedule;
-(int) getSchedule;

/**
 * 最大表示回数
 *
 */
-(void) setMaxDisplay:(int)maxDisplay;
-(int) getMaxDisplay;

// 現在の表示回数
-(int) getDisplayCount;
-(void) setDisplayCount:(int)displayCount; // 現在の広告表示回数を設定する（初期化等に使用可能）

/* 先読み機能
 * 通常(startShowAd)は広告情報取得->内部表示処理->画面反映という流れだが
 * preloadAd : 広告情報取得(取得済みならSkip) -> 内部表示処理
 * preloadShowAd : 画面反映処理
 * と処理を分ける事が出来る。
 */
-(void)preloadAd;
- (void) preloadShowAd;

@end

@protocol AdfurikunPopupViewDelegate
@optional
/**
 * 広告の表示/更新完了通知
 */
-(void)adfurikunViewDidFinishLoad:(AdfurikunPopupView *)view;
/**
 * 広告がクリックされたことの通知
 */
-(void)adfurikunViewAdTapped:(AdfurikunPopupView *)view;

/**
 * 広告情報の取得に失敗した場合
 *
 */
-(void)adfurikunViewAdFailed:(AdfurikunPopupView *)view;

/**
 * 広告が閉じられた場合
 *
 */
-(void)adfurikunViewAdClose:(AdfurikunPopupView *)view;


@end
