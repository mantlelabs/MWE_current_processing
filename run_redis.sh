#!/bin/bash

#  run redis/rq server in docker container

source read_config.sh src/config.cfg

#  create network
docker network create \
	--ip-range=${NETWORK_IP_RANGE} \
	--subnet=${NETWORK_SUBNET} \
	${DOCKER_NETWORK_NAME}


#  run redis server
docker run --rm -d \
	--name ${DC_REDIS} \
    --user ${REDIS_UID}:${REDIS_GID} \
    --ip=${REDIS_IP} \
 	-p ${REDIS_PORT}:${REDIS_PORT} \
 	--net=${DOCKER_NETWORK_NAME} \
 	${DI_REDIS}
