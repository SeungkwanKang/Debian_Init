FROM debian:10
# Make sure no interactive mode
ENV DEBIAN_FRONTEND noninteractive
COPY sources.list /etc/apt/sources.list
COPY .bashrc /root/.bashrc

RUN apt update -y && apt upgrade -y
RUN apt install -y \
  linux-image-5.9.0-0.bpo.5-amd64 \
  linux-headers-5.9.0-0.bpo.5-amd64
# Meta package for updates
RUN apt install -t buster-backports -y \
  linux-image-amd64 \
  linux-headers-amd64

RUN apt install -y \
  firmware-linux \
  firmware-misc-nonfree \
  software-properties-common

RUN apt install -t buster-backports -y \
  nvidia-driver \
  nvidia-cuda-dev \
  nvidia-cuda-toolkit

RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/debian10/x86_64/7fa2af80.pub
RUN add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/debian10/x86_64/ /"
RUN add-apt-repository contrib
RUN apt-get update -y && apt-get install -y freeglut3 freeglut3-dev libxi-dev libxmu-dev
RUN apt install -y cuda-11-2 cuda-runtime-11-2 cuda-drivers cuda-drivers-460 nvidia-libopencl1
RUN apt install -y cuda