# run code
./stereoVIOEuroc --dataset_type=0 --dataset_path=/mnt/d/zhipeng/datasets/Euroc_MAV/euroc-spark/V2_01_easy --initial_k=50 --final_k=10000 --params_folder_path=../params/Euroc --use_lcd=1 --vocabulary_path=../vocabulary/ORBvoc.yml --flagfile=../params/Euroc/flags/stereoVIOEuroc.flags --flagfile=../params/Euroc/flags/Mesher.flags --flagfile=../params/Euroc/flags/VioBackend.flags --flagfile=../params/Euroc/flags/RegularVioBackend.flags --flagfile=../params/Euroc/flags/Visualizer3D.flags --logtostderr=1 --colorlogtostderr=1 --log_prefix=1 --v=0 --vmodule=Pipeline*=00 --log_output=1 --log_euroc_gt_data=1 --save_frontend_images=1 --visualize_frontend_images=1 --output_path=../output_logs


# delete some lib that have been installed
sudo xargs rm < install_manifest.txt


# build opencv and opencv_contribution
cmake -DOPENCV_EXTRA_MODULES_PATH=/home/zhipeng/vscodeproject/opencv_contrib/modules -DBUILD_opencv_legacy=OFF -DWITH_VTK=On ..