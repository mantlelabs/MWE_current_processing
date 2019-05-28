#!/bin/bash

#  mount code directory and if necessary directories for data files,
#  input/output files etc

DIR=$(dirname $(readlink -f $0))

mounts=""

mounts="${mounts} -v ${DIR}/src:/home/${D_USERNAME}/src"
#  many more

MOUNT_DIRS="${mounts}"
