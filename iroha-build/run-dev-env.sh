#!/bin/bash

IMAGE_DOCKER=$1

if [ -z ${IMAGE_DOCKER} ] 
then
	echo "usage ./script 'image docker iroha for dev'"
	exit 1
fi



if [[ "$(docker images -q ${IMAGE_DOCKER} 2> /dev/null)" == "" ]]; then

	echo " no docker image ${IMAGE_DOCKER}"
	exit 1
else
	echo "image docker ${IMAGE_DOCKER} found"

fi

docker run -it \
    -v ${HOME}/CLionProjects/iroha:/home/iroha/iroha \
    ${IMAGE_DOCKER} \
    /bin/su - iroha
