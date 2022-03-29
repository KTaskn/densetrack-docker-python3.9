FROM python:3.9
MAINTAINER KTaskn <korai.kinjo@gmail.com>

RUN apt-get update -y && apt-get install -y wget cmake gcc g++ zip

ENV LD_LIBRARY_PATH=/usr/local/lib

WORKDIR /tmp

RUN wget -O densetrack-master.zip https://github.com/KTaskn/densetrack/archive/refs/heads/master.zip && unzip densetrack-master.zip
RUN wget -O opencv-3.4.zip https://github.com/opencv/opencv/archive/refs/heads/3.4.zip && unzip opencv-3.4.zip
RUN wget -O opencv_contrib-3.4.zip https://github.com/opencv/opencv_contrib/archive/refs/heads/3.4.zip && unzip opencv_contrib-3.4.zip
RUN mkdir -p /tmp/opencv-3.4/build
WORKDIR /tmp/opencv-3.4/build
RUN cmake -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr/local .. \
    -DOPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib-3.4/modules \
    && make -j4 \
    && make install

WORKDIR /tmp/densetrack-master

RUN python -m pip install pip && python -m pip install numpy && python setup.py install

WORKDIR /workspace