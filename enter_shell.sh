#!/bin/bash


#  This script opens a shell in a docker container from where we can add jobs
#  (we do this to add jobs from the same docker environment as the execution
#  will take place)


scriptdir="$(dirname "$(realpath "$0")")"
cd "$scriptdir"


source read_config.sh src/config.cfg

source mounts.sh



docker run --rm -it \
	--user ${D_UID}:${D_GID} \
	--network ${DOCKER_NETWORK_NAME} \
	--name s2proc_shell_$RANDOM \
	${MOUNT_DIRS} \
	${DI_WORKER} /bin/bash "$@"

