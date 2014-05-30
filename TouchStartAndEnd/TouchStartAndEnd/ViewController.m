//
//  ViewController.m
//  TouchStartAndEnd
//
//  Created by Hiromasa OHNO on 2014/05/28.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()

@property (strong, nonatomic) AVCaptureDeviceInput *videoInput;
@property (strong, nonatomic) AVCaptureStillImageOutput *stillImageOutput;
@property (strong, nonatomic) AVCaptureSession *session;
@property (strong, nonatomic) UIView *previewView;
@property (strong, nonatomic) AVCaptureMovieFileOutput *videoOutput;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.pressHoldButton.delegate = self;
    
    
    // プレビュー用のビューを生成
    self.previewView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view insertSubview:self.previewView belowSubview:self.pressHoldButton];
    
    // self.previewView.hidden = YES;
    
    // 撮影開始
}

- (void)setupAVCapture
{
    NSError *error = nil;
    
    // 入力と出力からキャプチャーセッションを作成
    self.session = [[AVCaptureSession alloc] init];
    
    // 正面に配置されているカメラを取得
    AVCaptureDevice *camera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // カメラからの入力を作成し、セッションに追加
    self.videoInput = [[AVCaptureDeviceInput alloc] initWithDevice:camera error:&error];
    [self.session addInput:self.videoInput];
    

    // 画像への出力を作成し、セッションに追加
    self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    [self.session addOutput:self.stillImageOutput];
    
    // キャプチャーセッションから入力のプレビュー表示を作成
    AVCaptureVideoPreviewLayer *captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    captureVideoPreviewLayer.frame = self.view.bounds;
    captureVideoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    // レイヤーをViewに設定
    CALayer *previewLayer = self.previewView.layer;
    previewLayer.masksToBounds = YES;
    [previewLayer addSublayer:captureVideoPreviewLayer];
    
    // セッション開始
    [self.session startRunning];
}

- (void)tearDownAVCapture
{
    [self.session stopRunning];
    for (AVCaptureOutput *output in self.session.outputs) {
        [self.session removeOutput:output];
    }
    for (AVCaptureInput *input in self.session.inputs) {
        [self.session removeInput:input];
    }
    self.stillImageOutput = nil;
    self.videoInput = nil;
    self.session = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setupAVCapture];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self tearDownAVCapture];
}

- (void)didStartHolding:(UIView *)targetView
{
    // self.previewView.hidden = NO;
    self.pressHoldButton.backgroundColor = [UIColor grayColor];
    
    // 動画ファイルへの出力
    self.videoOutput = [AVCaptureMovieFileOutput new];
    [self.session addOutput:self.videoOutput];
    
    NSString *documentDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSURL *saveURL = [NSURL fileURLWithPath:[documentDir stringByAppendingPathComponent:[NSString stringWithFormat:@"movie%ld.mov", time(0)]]];
    [self.videoOutput startRecordingToOutputFileURL:saveURL recordingDelegate:self];
}

- (void)didFinishHolding:(UIView *)targetView
{
    // self.previewView.hidden = YES;
    [self.videoOutput stopRecording];
    self.pressHoldButton.backgroundColor = [UIColor whiteColor];
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didStartRecordingToOutputFileAtURL:(NSURL *)fileURL fromConnections:(NSArray *)connections
{
    
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL fromConnections:(NSArray *)connections error:(NSError *)error
{
    [self.session removeOutput:self.videoOutput];
    self.videoOutput = nil;
    
    BOOL recordedSuccessfully = YES;
    if ([error code] != noErr) {
        // A problem occurred: Find out if the recording was successful.
        id value = [[error userInfo]
                    objectForKey:AVErrorRecordingSuccessfullyFinishedKey];
        if (value) {
            recordedSuccessfully = [value boolValue];
        }
    }
    
    if(!recordedSuccessfully){
        return;
    }
    
    
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    if ([assetsLibrary
         videoAtPathIsCompatibleWithSavedPhotosAlbum:outputFileURL]) {
        [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:outputFileURL
                                          completionBlock:^(NSURL *assetURL, NSError *error) {
                                              [self clearAllVideos];
                                          }];
    }
}

- (void)clearAllVideos
{
    NSFileManager  *manager = [NSFileManager defaultManager];

    // the preferred way to get the apps documents directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];

    // grab all the files in the documents dir
    NSArray *allFiles = [manager contentsOfDirectoryAtPath:documentsDirectory error:nil];

    // filter the array for only sqlite files
    NSPredicate *fltr = [NSPredicate predicateWithFormat:@"self ENDSWITH '.mov'"];
    NSArray *movFiles = [allFiles filteredArrayUsingPredicate:fltr];

    // use fast enumeration to iterate the array and delete the files
    for (NSString *movFile in movFiles)
    {
        NSError *error = nil;
        [manager removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:movFile] error:&error];
        NSAssert(!error, @"Assertion: Mov file deletion shall never throw an error.");
    }
}

@end
