#!/bin/bash


#  build docker images for the redis/RQ server and the docker worker



source read_config.sh src/config.cfg

echo "${D_USERNAME} (${D_UID})"
echo "${D_GROUP} (${D_GID})"

#  build worker
docker build -t ${DI_WORKER} \
	--no-cache \
	--build-arg USERNAME=${D_USERNAME} \
	--build-arg UID=${D_UID} \
	--build-arg GROUP=${D_GROUP} \
	--build-arg GID=${D_GID} \
	worker/Dockerfile/


docker build -t ${DI_REDIS} \
	--no-cache \
	docker-rq/server



