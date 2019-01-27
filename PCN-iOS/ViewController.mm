//
//  ViewController.m
//  PCN-iOS
//
//  Created by Le Hoang Vu on 1/27/19.
//  Copyright © 2019 Le Hoang Vu. All rights reserved.
//

#import "ViewController.h"

#import <opencv2/opencv.hpp>
#import <opencv2/videoio/cap_ios.h>

#include <iostream>
#include <vector>
#include <iostream>
#include <fstream>

#import "PCN.h"

using namespace std;
using namespace cv;

@interface ViewController () <CvVideoCameraDelegate> {
    PCN* detector;
}

@property (nonatomic, strong) CvVideoCamera* videoCamera;
@property (weak, nonatomic) IBOutlet UIView *cameraView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:self.cameraView];
    self.videoCamera.delegate = self;
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack;
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset640x480;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30;
    self.videoCamera.grayscaleMode = NO;
    
    NSBundle* bundle = NSBundle.mainBundle;
    std::string pcnPath = [bundle pathForResource:@"PCN" ofType:@"caffemodel"].UTF8String;
    std::string pcnPath1 = [bundle pathForResource:@"PCN-1" ofType:@"prototxt"].UTF8String;
    std::string pcnPath2 = [bundle pathForResource:@"PCN-2" ofType:@"prototxt"].UTF8String;
    std::string pcnPath3 = [bundle pathForResource:@"PCN-3" ofType:@"prototxt"].UTF8String;
    
    // You must free 'detector' point when needed
    detector = new PCN(pcnPath, pcnPath1, pcnPath2, pcnPath3);
    detector->SetMinFaceSize(100);
    detector->SetScoreThresh(0.37, 0.43, 0.95);
    detector->SetImagePyramidScaleFactor(1.414);
    detector->SetVideoSmooth(true);
}

- (IBAction)startCapture:(id)sender {
    [self.videoCamera start];
}

- (void)processImage:(cv::Mat &)image
{
    cv::Mat img;

    if (image.channels() == 4) {
        cvtColor(image, img, cv::COLOR_BGRA2RGB);
    }
    
    NSTimeInterval start = [NSDate timeIntervalSinceReferenceDate];
    auto faces = detector->DetectFace(img);
    NSTimeInterval end = [NSDate timeIntervalSinceReferenceDate];
    
    NSString* fps = [NSString stringWithFormat:@"FPS: %f", 1.0f/(end - start)];
    NSLog(@">>>> FPS: %f", 1.0f/(end - start));
    
    cv::putText(image, fps.UTF8String, cv::Point(20, 45), 4, 1, cv::Scalar(0, 0, 125));
    
    for (int i = 0; i < faces.size(); i++)
    {
        DrawFace(image, faces[i]);
    }
}


@end
