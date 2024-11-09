#!/bin/bash

#Create and set ouput directories
sudo mkdir /opt/arm_64/output
sudo mkdir /opt/arm_32/output
ARM64_OUTPUT_DIR="/opt/arm_64/output"
ARM32_OUTPUT_DIR="/opt/arm_32/output"

#Set openssl directories
ARM64_OPENSSL_DIR="/opt/arm_64/openssl"
ARM32_OPENSSL_DIR="/opt/arm_32/openssl"

echo "Cross compile Mosqitto for ARM64 with TLS support"

#Prepare for Cross compilation 
export CROSS_COMPILE=/opt/arm_64/arm/bin/aarch64-none-linux-gnu-
export CC=${CROSS_COMPILE}gcc
export CXX=${CROSS_COMPILE}g++
export AR=${CROSS_COMPILE}ar
export RANLIB=${CROSS_COMPILE}ranlib
export LD=${CROSS_COMPILE}ld
export XML_CATALOG_FILES="/etc/xml/catalog"


# Set CFLAGS and LDFLAGS for ARM
export CFLAGS="-I${ARM64_OPENSSL_DIR}/include"
export LDFLAGS="-L${ARM64_OPENSSL_DIR}/lib -Wl,-rpath,${ARM64_OPENSSL_DIR}/lib -Wl,-rpath-link,${ARM64_OPENSSL_DIR}/lib"


# Mosquitto directory
cd ~/Downloads/mosquitto-2.0.20

#Clean previous builds
sudo make clean

# Cross compile Mosqitto for ARM64 with TLS support
sudo make CC=${CC} CXX=${CXX} AR=${AR} LD=${LD} RANLIB=${RANLIB} CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" WITH_TLS=yes 
sudo make install DESTDIR="${ARM64_OUTPUT_DIR}"





echo "Cross compile Mosqitto for ARM32 with TLS support"

#Prepare for Cross Compilation
export CROSS_COMPILE=/opt/arm_32/arm/bin/arm-none-linux-gnueabihf-
export CC=${CROSS_COMPILE}gcc
export CXX=${CROSS_COMPILE}g++
export AR=${CROSS_COMPILE}ar
export RANLIB=${CROSS_COMPILE}ranlib
export LD=${CROSS_COMPILE}ld
export XML_CATALOG_FILES="/etc/xml/catalog"


# Set CFLAGS and LDFLAGS for ARM
export CFLAGS="-I${ARM32_OPENSSL_DIR}/include"
export LDFLAGS="-L${ARM32_OPENSSL_DIR}/lib -Wl,-rpath,${ARM32_OPENSSL_DIR}/lib -Wl,-rpath-link,${ARM32_OPENSSL_DIR}/lib"

# Mosquitto directory
cd ~/Downloads/mosquitto-2.0.20

#Clean previous builds
sudo make clean

# Cross compile Mosqitto for ARM64 with TLS support
sudo make CC=${CC} CXX=${CXX} AR=${AR} LD=${LD} RANLIB=${RANLIB} CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" WITH_TLS=yes 
sudo make install DESTDIR="${ARM32_OUTPUT_DIR}"


