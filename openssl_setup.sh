#!/bin/bash

#Cross compile openssl for ARM64

sudo mkdir /opt/arm_64/openssl

export CROSS_COMPILE=/opt/arm_64/arm/bin/
export CC=aarch64-none-linux-gnu-gcc
export CXX=aarch64-none-linux-gnu-g++
export AR=aarch64-none-linux-gnu-gcc-ar

sudo ./Configure linux-aarch64 --cross-compile-prefix=/opt/arm_64/arm/bin/aarch64-none-linux-gnu- --prefix=/opt/arm_64/openssl/

sudo make
sudo make install


#Cross compile openssl for ARM32

sudo mkdir /opt/arm_32/openssl

export CROSS_COMPILE=/opt/arm_32/arm/bin/
export CC=arm-none-linux-gnueabihf-gcc
export CXX=arm-none-linux-gnueabihf-g++
export AR=arm-none-linux-gnueabihf-ar

sudo ./Configure linux-armv4 --cross-compile-prefix=/opt/arm_32/arm/bin/arm-none-linux-gnueabihf- --prefix=/opt/arm_32/openssl/
