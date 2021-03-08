FROM debian:10
ENV DEBIAN_FRONTEND noninteractive
COPY .bashrc /root
RUN apt update && apt upgrade -y && \
	apt install -y \
	build-essential \
	git \
	python-dev \
	cmake \
	gdb \
	man \
	python-pip \
	python3-pip \
	software-properties-common \
	gdb \
	valgrind
RUN echo 'deb http://deb.debian.org/debian testing main' >> /etc/apt/sources.list && \
	apt update -y && \
	apt install -y \
	gcc-9 \
	g++-9 \
	cmake && \
	apt autoremove -y
COPY sources.list /etc/apt/sources.list
RUN apt update &&	apt upgrade -y

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip3 install -r requirements.txt