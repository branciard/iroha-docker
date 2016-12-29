#!/bin/bash

#-----------------------------------------------------------------------
# iroha_build - IROHA building scripts (Build IROHA)
#
# Copyright (c) 2016 Soramitsu,Co.,Ltd.
# All Rights Reserved.
#-----------------------------------------------------------------------

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

export IROHA_HOME=~/iroha
export IROHA_DEST=/usr/local/iroha

cd ~

BRANCH=""
REPO=""
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -b|--branch)
    BRANCH="$2"
    shift # past argument
    ;;
    -r|--repo)
    REPO="$2"
    shift # past argument
    ;;
    *)
     echo "Programming error"
     exit 3
    ;;
esac
shift # past argument or value
done

if [ "" == "${BRANCH}" ]
then
	if [ "" == "${REPO}" ]
	then
		git clone --recursive https://github.com/branciard/iroha.git iroha
	else
		git clone --recursive https://github.com/${REPO}/iroha.git iroha
        	if [ $? > 0 ]
        	then
                	echo " error : cannot git clone https://github.com/${REPO}/iroha.git"
                	exit 1
        	fi 
	fi
else
        if [ "" ==  "${REPO}" ]
        then
                git clone -b $BRANCH --recursive https://github.com/branciard/iroha.git iroha
		if [ $? > 0 ]
        	then
               		echo " error : cannot clone git branch $BRANCH --recursive https://github.com/branciard/iroha.git"
                	exit 1
       		fi 
	else
                git clone -b $BRANCH --recursive https://github.com/${REPO}/iroha.git iroha
                if [ $? > 0 ]
                then
                        echo " error : cannot clone git branch $BRANCH --recursive https://github.com/${REPO}/iroha.git"
                        exit 1
                fi
        fi
fi


sudo apt -y install autoconf automake libtool pkg-config

cd /tmp
git clone -b v3.0.0 https://github.com/google/protobuf.git

cd protobuf
git cherry-pick 1760feb621a913189b90fe8595fffb74bce84598
./autogen.sh
./configure --prefix=/usr
make -j 14
sudo make install

cd /tmp
git clone -b $(curl -L http://grpc.io/release) https://github.com/grpc/grpc

cd grpc
git submodule update --init
make
sudo make install

cd ${IROHA_HOME}/core/vendor/leveldb
make

cd ${IROHA_HOME}/core/vendor/ed25519
make

cd ${IROHA_HOME}/core/vendor/KeccakCodePackage
make && make generic64/libkeccak.a

cd ${IROHA_HOME}/core/infra/crypto
make

mkdir ${IROHA_HOME}/build
cd ${IROHA_HOME}/build
cmake ..
make

sudo mkdir ${IROHA_DEST}

cd ${IROHA_HOME}/build
sudo rsync -av bin lib my_test_bin test_bin ${IROHA_DEST}

exit 0
