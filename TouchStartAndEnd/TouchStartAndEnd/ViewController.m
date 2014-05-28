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
    
    self.momentarySwitch.delegate = self;
    
    
    // プレビュー用のビューを生成
    self.previewView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.previewView];
    self.previewView.hidden = YES;
    
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

- (void)on
{
    self.previewView.hidden = NO;
    
    // 動画ファイルへの出力
    self.videoOutput = [AVCaptureMovieFileOutput new];
    [self.session addOutput:self.videoOutput];
    
    NSString *documentDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSURL *saveURL = [NSURL fileURLWithPath:[documentDir stringByAppendingPathComponent:[NSString stringWithFormat:@"movie%ld.mov", time(0)]]];
    [self.videoOutput startRecordingToOutputFileURL:saveURL recordingDelegate:self];
}

- (void)off
{
    self.previewView.hidden = YES;
    [self.videoOutput stopRecording];
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
                                          completionBlock:NULL];
    }
}

@end
