FROM debian:10
ENV DEBIAN_FRONTEND noninteractive
COPY .bashrc /root
RUN apt update && apt upgrade -y && \
	apt install -y \
	autoconf \
	build-essential \
	bison \
	chrpath \
	cmake \
	ctags \
	default-jdk \
	default-jre \
	device-tree-compiler \
	diffstat \
	expat \
	flex \
	gdb \
	gengetopt \
	gettext \
	git \
	libgmp-dev \
	libgtk-3-dev \
	libmpfr-dev \
	libmpc-dev \
	libexpat1-dev \
	libusb-dev \
	libncurses5-dev \
	libguestfs-tools \
	man \
	patch \
	python-dev \
	python-pip \
	python3-dev \
	python3-pip \
	rsync \
	software-properties-common \
	subversion \
	texinfo \
	texi2html \
	unzip \
	valgrind \
	vim \
	wget \
	zip \
	zlib1g-dev

SHELL ["/bin/bash", "-c"]
RUN curl -s "https://get.sdkman.io" | bash && \
	source /root/.sdkman/bin/sdkman-init.sh && \
	sdk install java 11.0.10.hs-adpt && \
	sdk install sbt

RUN cd /root && \
	git clone http://git.veripool.org/git/verilator && \
	cd verilator && \
	git checkout v4.034 && \
	autoconf && \
	./configure && \
	make -j12 && \
	make install

RUN cd /root && \
	git clone https://github.com/ucb-bar/chipyard.git && \
	cd chipyard && \
	./scripts/init-submodules-no-riscv-tools.sh && \
	export MAKEFLAGS=-j12 && \
	./scripts/build-toolchains.sh riscv-tools

#COPY requirements.txt requirements.txt
#RUN pip install -r requirements.txt
#RUN pip3 install -r requirements.txt
WORKDIR /root