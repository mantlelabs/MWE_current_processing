#!/bin/bash

#  stop one or more processing workers running in the background

if [ "$#" -eq 1 ]; then
	start_nr=$1
	end_nr=$1
elif [ "$#" -eq 2 ]; then
	start_nr=$1
	end_nr=$2
fi

if [ "$#" -gt 2 ] || [ $start_nr -gt $end_nr ] || [ "$#" -eq 0 ]; then
	echo "Invalid input!"
	exit 1
fi


source read_config.sh src/config.cfg

for (( i=$start_nr; i<=$end_nr; i++ ))
do
	docker stop ${DC_WORKER}_$i
done
