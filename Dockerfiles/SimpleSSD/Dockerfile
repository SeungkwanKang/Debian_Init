FROM debian:10
ENV DEBIAN_FRONTEND noninteractive
COPY .bashrc /root
# Add simplessd-fs files in this directory
COPY simplessd-fs/. /root/simplessd-fs
RUN apt update && apt upgrade -y && \
  apt install -y \
  build-essential \
  git \
  scons \
  python-dev \
  zlib1g-dev \
  m4 \
  cmake \
  gdb \
  libprotobuf-dev \
  protobuf-compiler \
  libgoogle-perftools-dev \
  man \
  python-pip \
  software-properties-common \
  gdb \
  valgrind
RUN echo 'deb http://deb.debian.org/debian testing main' >> /etc/apt/sources.list && \
  apt update -y && \
  apt install -y \
  gcc-9 \
  g++-9 \
  cmake
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt