# PCN-iOS

A ported implementation of PCN face detection on caffe for iOS devices. 

## Links
- [FaceKit by Jack-CV](https://github.com/Jack-CV/FaceKit)
- [Real-Time Rotation-Invariant Face Detection and Tracking by Jack-CV](https://github.com/Jack-CV/FaceKit/tree/master/PCN)
- [Caffe-iOS by lsy17096535](https://github.com/lsy17096535/Caffe-ios)

## Results (on iPhone 6S+)

## Note
##### You can replace caffe-ios by another caffe-ios implementation to reduce speed, performance, stability,...
##### The current caffe-ios lib is used with CPU_ONLY mode only because iOS platform don't support CUDA. 

## More infos
- XCode 10.1
- Objective-C
- C++
- OpenCV@2
- Real-Time Rotation-Invariant Face Detection

---
# Real-Time Rotation-Invariant Face Detection with Progressive Calibration Networks

Progressive Calibration Networks (PCN) is an accurate rotation-invariant face detector running at real-time speed on CPU. This is an implementation for PCN.


### Results

Some detection results can be viewed in the following illustrations:

<img src='result/demo.png' width=800 height=410>

<img src='result/3.jpg' width=800 height=475>

<img src='result/1.gif' width=800 height=460>

<img src='result/2.gif' width=800 height=460>

PCN is designed aiming for low time-cost. We compare PCN's speed with other rotation-invariant face detectors' on standard VGA images(640x480) with 40x40 minimum face size. The detectors run on a desktop computer with 3.4GHz CPU, GTX Titan X. The speed results together with the recall rate at 100 false positives on multi-oriented FDDB are shown in the following table. Detailed experiment settings can be found in our paper. It is worth mentioning that converting the square results to rectangles or ellipses is helpful to fit the ground-truth data. In this way, better accuracy can be achieved. But we do not convert the results here.

<img src='result/result.png' width=800 height=150>

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
---


##### Thank authors: Jack-CV, lsy17096535

### Citing PCN
    @inproceedings{shiCVPR18pcn,
        Author = {Xuepeng Shi and Shiguang Shan and Meina Kan and Shuzhe Wu and Xilin Chen},
        Title = {Real-Time Rotation-Invariant Face Detection with Progressive Calibration Networks},
        Booktitle = {The IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},
        Year = {2018}
    }
