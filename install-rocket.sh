#!/bin/bash

# Install risv-toolchain
sudo apt-get install autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev device-tree-compiler libusb-1.0-0 libusb-1.0-0-dev default-jre default-jdk

cd ~/GitRepo
git clone https://github.com/riscv/riscv-gnu-toolchain && \
cd riscv-gnu-toolchain && \
git submodule update --init --recursive

./configure --prefix=/opt/riscv
make linux
echo 'PATH="$PATH:/opt/riscv/bin"' | sudo tee >> ~/.bashrc
source ~/.bashrc

#install rocket-chip
cd ~/GitRepo
git clone https://github.com/ucb-bar/rocket-chip.git && \
cd rocket-chip && \
git submodule update --init

# Install rocket tools
cd ~/GitRepo
git clone https://github.com/freechipsproject/rocket-tools && \
cd rocket-tools && \
git submodule update --init --recursive
echo 'export RISCV=/opt/riscv-toolchain' | sudo tee >> ~/.bashrc
export MAKEFLAGS="$MAKEFLAGS -j12"
source ~/.bashrc
sudo -E ./build.sh

# Build rocket-chip
cd ~/GitRepo/rocket-chip/emulator
make -j12 run-asm-test
cd ~/GitRepo/rocket-chip/vsim
make -j12 run-bmark-tests