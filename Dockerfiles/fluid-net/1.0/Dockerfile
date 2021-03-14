FROM kangsk/debian:10.2
ENV DEBIAN_FRONTEND noninteractive
RUN apt install -y \
	wget \
	unzip \
	libgl1-mesa-glx \
	libxt6 \
	libglu1-mesa \
	libsm6 \
	lib3ds-1-3 \
	xvfb \
	doxygen \
	libglu1-mesa-dev \
	mesa-common-dev \
	qtdeclarative5-dev \
	qml-module-qtquick-controls

RUN cd /root && \
	git clone git@github.com:google/FluidNet.git && \
	mv FluidNet fluid-net
COPY generate_binvox_files.py /root/fluid-net/voxelizer

RUN cd /root/fluid-net && \
	git clone git@github.com:kristofe/manta.git && \


	RUN cd /root/fluid-net/voxelizer && \
	mkdir objs && \
	cd objs && \
	wget https://cs.nyu.edu/~schlacht/NTU3D.v1_0-999.zip && \
	unzip NTU3D.v1_0-999.zip && \
	wget https://www.dropbox.com/sh/5f3t9abmzu8fbfx/AAAkzW9JkkDshyzuFV0fAIL3a/bunny.capped.obj

RUN cd /root/fluid-net/voxelizer && \
	wget http://www.patrickmin.com/binvox/linux64/binvox?rnd=1615179201380297 && \
	mv binvox\?rnd\=1615179201380297 binvox && \
	chmod +x binvox && \
	python generate_binvox_files.py

