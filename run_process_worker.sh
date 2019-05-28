#!/bin/bash

#  start number of processing worker containers; can be used like:
#
#  	./start_process_worker
#  		-> single worker is started, random number is appended to name
#
#  	./start_process_worker 1 5
#  		-> 5 workers nubered from 1 to 5 are started


if [ "$#" -eq 0 ]; then
	start_nr=$RANDOM
	end_nr=$start_nr
	flag="-d"
elif [ "$#" -eq 1 ]; then
	start_nr=$1
	end_nr=$start_nr
	flag="-d"
elif [ "$#" -eq 2 ]; then
	start_nr=$1
	end_nr=$2
	flag="-d"
elif [ "$#" -eq 3  ]; then
	start_nr=$1
	end_nr=$2
	flag=$3
fi


if [ "$#" -gt 3 ] || [ $start_nr -gt $end_nr ]; then
	echo "Invalid input!"
	exit 1
fi

source read_config.sh src/config.cfg

source mounts.sh

for (( i=$start_nr; i<=$end_nr; i++ ))
do
	docker run --rm $flag \
		--user ${D_UID}:${D_GID} \
		--memory=10g \
		--oom-kill-disable \
		--network ${DOCKER_NETWORK_NAME} \
		--name ${DC_WORKER}_$i \
		${MOUNT_DIRS} \
		-e LC_ALL=C.UTF-8 \
		-e LANG=C.UTF-8 \
		${DI_WORKER} rq worker -u redis://${REDIS_IP}:${REDIS_PORT}/ ${QU_TEST}
		done
