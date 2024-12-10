# Kimera-VIO: Open-Source Visual Inertial Odometry

build Kimera-VIO from scratch for pengzai

gtsam 4.2.0

```bash
git checkout 4.2

cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=Release -DGTSAM_USE_SYSTEM_EIGEN=ON -DGTSAM_POSE3_EXPMAP=ON -DGTSAM_ROT3_EXPMAP=ON -DGTSAM_TANGENT_PREINTEGRATION=OFF ..

```


opengv

before you build, set CXX_STANDARD 17 in CMakeLists.txt
and command the line 39 add_definitions (-march=native) that is for CXX_STANDARD 11 in CMakeLists.txt, as the whole project will be built in C++ 17

otherwise, it will occurs **segmentation fault** when you run loop clourse detection modules

```bash
#  Replace path to your GTSAM's Eigen
cmake .. -DEIGEN_INCLUDE_DIR=/home/zhipeng/vscodeproject/gtsam/gtsam/3rdparty/Eigen -DEIGEN_INCLUDE_DIRS=/home/zhipeng/vscodeproject/gtsam/gtsam/3rdparty/Eigen
```



# opencv 3.4.0
only pass test in 3.4.0, don't try opencv 4.2.0, it didn't work for this code.

you need to build opencv and opencv_contribution, remember checkout to 3.4.0, before you build
```bash
cd opencv_contrib
git checkout tags/3.4.0
cd opencv
git checkout tags/3.4.0

```

```bash
cmake -DOPENCV_EXTRA_MODULES_PATH=/home/zhipeng/vscodeproject/opencv_contrib/modules -DBUILD_opencv_legacy=OFF -DWITH_VTK=On ..
```

when you build package about python_opencv, there is an error 
> **opencv/modules/python/src2/cv2.cpp:885**:34: error: invalid conversion from ‘const char*’ to ‘char*’ [-fpermissive] char* str = PyString_AsString(obj);

solution:
```C++
edit that line to be const char* str = PyString_AsString(obj);
```



# run code
./stereoVIOEuroc --dataset_type=0 --dataset_path=/mnt/d/zhipeng/datasets/Euroc_MAV/euroc-spark/V2_01_easy --initial_k=50 --final_k=10000 --params_folder_path=../params/Euroc --use_lcd=1 --vocabulary_path=../vocabulary/ORBvoc.yml --flagfile=../params/Euroc/flags/stereoVIOEuroc.flags --flagfile=../params/Euroc/flags/Mesher.flags --flagfile=../params/Euroc/flags/VioBackend.flags --flagfile=../params/Euroc/flags/RegularVioBackend.flags --flagfile=../params/Euroc/flags/Visualizer3D.flags --logtostderr=1 --colorlogtostderr=1 --log_prefix=1 --v=0 --vmodule=Pipeline*=00 --log_output=1 --log_euroc_gt_data=1 --save_frontend_images=1 --visualize_frontend_images=1 --output_path=../output_logs


# delete some lib that have been installed
sudo xargs rm < install_manifest.txt



