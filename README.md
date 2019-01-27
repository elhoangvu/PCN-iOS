# PCN-iOS

A ported implementation of PCN face detection on caffe for iOS devices. Get from Real-Time Rotation-Invariant Face Detection by Jack-CV: https://github.com/Jack-CV/FaceKit/tree/master/PC

## Links
- [FaceKit by Jack-CV](https://github.com/Jack-CV/FaceKit)
- [Real-Time Rotation-Invariant Face Detection and Tracking by Jack-CV](https://github.com/Jack-CV/FaceKit/tree/master/PCN)
- [Caffe-iOS by lsy17096535](https://github.com/lsy17096535/Caffe-ios)

## Results (on iPhone 6S+)
- iPhone 6S+
- Camera capture preset: 640x480
- Below talbe is a record about PCN benmark on iPhone 6S+ including cases of no face recognition.

| Min face size | Number of faces| FPS ~      |
| --------------|:--------------:|-----------:|
|45             | 1              |93-108 FPS  |
|45             | 2              |57-58 FPS   |
|45             | 3              |34-37 FPS   |
|45             | 4              |22-23 FPS   |
|45             | 5              |21-22 FPS   | 

<img src="https://github.com/elhoangvu/PCN-iOS/blob/master/Results/1.PNG" width="32%"> <img src="https://github.com/elhoangvu/PCN-iOS/blob/master/Results/2.PNG" width="32%"> <img src="https://github.com/elhoangvu/PCN-iOS/blob/master/Results/3.PNG" width="32%">

<img src="https://github.com/elhoangvu/PCN-iOS/blob/master/Results/4.PNG" width="49%"> <img src="https://github.com/elhoangvu/PCN-iOS/blob/master/Results/5.PNG" width="49%">


### Usage

Set minimum size of faces to detect (`size` >= 20)

- `detector.SetMinFaceSize(size);`
  
Set scaling factor of image pyramid (1.4 <= `factor` <= 1.6)
  
- `detector.SetImagePyramidScaleFactor(factor);`
  
Set score threshold of detected faces (0 <= `thresh1`, `thresh2`, `thresh3` <= 1)
  
- `detector.SetScoreThresh(thresh1, thresh2, thresh3);`

Smooth the face boxes or not (smooth = true or false, recommend using it on video to get stabler face boxes)
  
- `detector.SetVideoSmooth(smooth);`

See [picture.cpp](picture.cpp) and [video.cpp](video.cpp) for details. If you want to reproduce the results on FDDB, please run [fddb.cpp](fddb.cpp). You can rotate the images in FDDB to get FDDB-left, FDDB-right, and FDDB-down, then test PCN on them respectively. 

## Note
##### You can replace caffe-ios by another caffe-ios implementation to reduce speed, performance, stability,...
##### The current caffe-ios lib is used with CPU_ONLY mode only because iOS platform don't support CUDA. 

## Issues
- Some faces are difficult to detect.

## More infos
- XCode 10.1
- Objective-C
- C++
- OpenCV@2
- Caffe iOS
- Real-Time Rotation-Invariant Face Detection

### Thank authors: Jack-CV, lsy17096535

### Citing PCN
    @inproceedings{shiCVPR18pcn,
        Author = {Xuepeng Shi and Shiguang Shan and Meina Kan and Shuzhe Wu and Xilin Chen},
        Title = {Real-Time Rotation-Invariant Face Detection with Progressive Calibration Networks},
        Booktitle = {The IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},
        Year = {2018}
    }
