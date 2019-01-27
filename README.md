# PCN-iOS

A ported implementation of PCN face detection on caffe for iOS devices. Get from Real-Time Rotation-Invariant Face Detection by Jack-CV: https://github.com/Jack-CV/FaceKit/tree/master/PC

## Links
- [FaceKit by Jack-CV](https://github.com/Jack-CV/FaceKit)
- [Real-Time Rotation-Invariant Face Detection and Tracking by Jack-CV](https://github.com/Jack-CV/FaceKit/tree/master/PCN)
- [Caffe-iOS by lsy17096535](https://github.com/lsy17096535/Caffe-ios)

## Results (on iPhone 6S+)
- iPhone 6S+
- Camera capture preset: 640x480

| Min face size | Number of faces| Time  | FPS |
| ------------- |:-------------: | -----:|----:|
| 40            | 1              |       |     |
| 60            | 1              |       |     |
| 80            | 1              |       |     |
| 100           | 1              |       |     |
| 40            | 3              |       |     |
| 60            | 3              |       |     |
| 80            | 3              |       |     |
| 100           | 3              |       |     |

### Usage

Set minimum size of faces to detect (`size` >= 20)

- `detector.SetMinFaceSize(size);`
  
Set scaling factor of image pyramid (1.4 <= `factor` <= 1.6)
  
- `detector.SetImagePyramidScaleFactor(factor);`
  
Set score threshold of detected faces (0 <= `thresh1`, `thresh2`, `thresh3` <= 1)
  
- `detector.SetScoreThresh(thresh1, thresh2, thresh3);`

Smooth the face boxes or not (smooth = true or false, recommend using it on video to get stabler face boxes)
  
- `detector.SetVideoSmooth(smooth);`

## Note
##### You can replace caffe-ios by another caffe-ios implementation to reduce speed, performance, stability,...
##### The current caffe-ios lib is used with CPU_ONLY mode only because iOS platform don't support CUDA. 

## More infos
- XCode 10.1
- Objective-C
- C++
- OpenCV@2
- Real-Time Rotation-Invariant Face Detection

### Thank authors: Jack-CV, lsy17096535

### Citing PCN
    @inproceedings{shiCVPR18pcn,
        Author = {Xuepeng Shi and Shiguang Shan and Meina Kan and Shuzhe Wu and Xilin Chen},
        Title = {Real-Time Rotation-Invariant Face Detection with Progressive Calibration Networks},
        Booktitle = {The IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},
        Year = {2018}
    }
