#!/bin/bash
# Usage:
# ./am-train.sh GPU
#
# Example:
# ./am-train.sh 0,1,2,3

GPU_ID=$1
# ##########use pretrained model ############
# ./../../AM-Softmax-caffe/build/tools/caffe train -solver am-softmax-solver.prototxt -weights am_result/am_face_train_test_iter_32000.caffemodel -gpu ${GPU_ID} 2>&1 | tee result/am_sphereface_train.log

########### train from scratch ###########
./../../AM-Softmax-caffe/build/tools/caffe train -solver am-softmax-solver.prototxt -gpu ${GPU_ID} 2>&1 | tee ../result/am-softmax_train.log
