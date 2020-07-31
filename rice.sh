#!/bin/sh

git clone https://github.com/KangSK-KAIST/Debian_Init.git && cd Debian_Init
./main.sh
cd ..
rm -rf Debian_Init
rm rice.sh
