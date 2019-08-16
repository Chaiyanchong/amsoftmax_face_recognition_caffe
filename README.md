# amsoftmax_face_recognition_caffe
A caffe implementation of am-softmax loss face recognition

### Installation
1. Clone our repository. The directory 'amsoftmax_face_recognition_caffe' that you cloned will be called as **`ROOT_DIR`**.

    ```Shell
    git clone --recursive git@github.com:zjchenchujie/amsoftmax_face_recognition_caffe.git
    ```

2. Build Caffe and pycaffe

    Caffe is forked from [Here](https://github.com/happynear/caffe-windows/tree/504d8a85f552e988fabff88b026f2c31cb778329). 
    This Caffe project can be built on both Windows and Linux.
    Your will need to configure your own `Makefile.config`.

    ```Shell
    cd $ROOT_DIR/AM-Softmax-caffe/
    # Now follow the Caffe installation instructions here:
    # http://caffe.berkeleyvision.org/installation.html
    make all -j8 && make pycaffe
    ```


### Usage

*After successfully completing the [installation](#installation)*, you are ready to run all the following experiments.

#### Part 1: Preprocessing
**Note:** In this part, we assume you are in the directory **`$ROOT_DIR/preprocess/`**
1. Download the training set (`CASIA-WebFace`) and place them in **`data/`**.

	```Shell
	cp -r /your_path/CASIA_WebFace  data/
	```
    Please make sure that the directory of **`data/`** contains the datasets.
    
2. Detect faces and facial landmarks using `MTCNN` (see: [MTCNN - face detection & alignment](https://github.com/kpzhang93/MTCNN_face_detection_alignment)).

	```python 3
	python code/face_detect_mtcnn.py
	```
    This will create a directory `CASIA_WebFace-96x112` in the directory of **`result/`**.
    All the faces has been resized to width:96 x height: 112 in this directory.
    
#### Part 2: Train
**Note:** In this part, we assume you are in the directory **`$ROOT_DIR/train/`**

1. Train the model.

	```Shell
	cd prototxt
	./am-train.sh 0
	```
    Note that in `am-softmax-train.prototxt`, layer`fc6_l2_ft` num_output 
    should equal to the number of image directories. We set to 11833 here because we have 11833 different people's photos.  
    After training, a model `am-softmax-face_iter_36000.caffemodel` and a corresponding log file are placed in the directory of `result/`.
