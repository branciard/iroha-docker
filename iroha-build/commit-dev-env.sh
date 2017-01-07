#!/bin/bash
bash stop-iroha-build.sh
DOCKER_CONTAINER=$1

if [ -z ${DOCKER_CONTAINER} ] 
then
	echo "usage ./script 'docker container to commit into hyperledger/iroha-build'"
	exit 1
fi


if [ "$( docker inspect -f {{.State.Running}} ${DOCKER_CONTAINER} )" == "true"  ]
then
	echo "image docker ${DOCKER_CONTAINER} found and runnning"
else
	echo " no running docker container ${DOCKER_CONTAINER}"
	exit 1
fi

docker commit ${DOCKER_CONTAINER} hyperledger/iroha-build

bash run-iroha-build.sh
