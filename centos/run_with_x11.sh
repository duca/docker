#!/bin/bash
XSOCK=/tmp/.X11-unix/X0
XAUTH=/tmp/.docker.xauth
chmod 644 ${XAUTH}
# xauth nlist ${DISPLAY} | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
# XSOCK=$(ls /tmp/.X11-unix/*) && docker run --rm --network=host -it -e DISPLAY:$DISPLAY -v $XSOCK:$XSOCK -v $HOME/work:/home/compass/work:Z  compass-compilation

xauth nlist ${DISPLAY} | sed -e 's/^..../ffff/' | xauth -f ${XAUTH} nmerge - &&\
    docker run \
	   -itd \
	   --rm \
	   --network=host \
	   -m 20G \
	   -e DISPLAY=${DISPLAY} \
	   -e LC_ALL=en_US.utf8 \
	   -v ${XAUTH}:${XAUTH}:Z \
	   -v ${XSOCK}:${XSOCK}:Z \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
	   -v ${1}:/home/compass/work:Z \
	   -v ${HOME}/apps:/home/centos/apps:Z \
	   -v ${HOME}/.ccache:/home/centos/.ccache:Z \
	   -v ${HOME}/.emacs.d:/home/centos/.emacs.d:Z \
           -v ${HOME}/.ssh:/home/centos/.ssh \
	   -v ${HOME}/.gitconfig:/home/centos/.gitconfig \
	   -v ${HOME}/apps/ttf:/home/centos/.local/fonts \
           -v ${HOME}/usr:/home/centos/usr:Z \
           -v /opt/Qt:/opt/qt_complete \
           --ipc="host"\
	   --privileged \
           --device=/dev/nvidiactl --device=/dev/nvidia-uvm --device=/dev/nvidia0\
	   dev:centos7_emacs
