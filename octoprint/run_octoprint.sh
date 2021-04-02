#!/bin/bash
SERIAL=$1
shift
docker run \
           --net="host" \
           -m 4G \
           -e LC_ALL=en_US.utf8 \
           -v octoprint:/octoprint\
           --device ${SERIAL}:${SERIAL} \
           -p 80:80 \
           --ipc="host"\
           --privileged \
           octoprint/octoprint



