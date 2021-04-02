#!/bin/bash
XSOCK=/tmp/.X11-unix/X0
XAUTH=/tmp/.docker.xauth
chmod 644 ${XAUTH}
# xauth nlist ${DISPLAY} | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
# XSOCK=$(ls /tmp/.X11-unix/*) && docker run --rm --network=host -it -e DISPLAY:$DISPLAY -v $XSOCK:$XSOCK -v $HOME/work:/home/compass/work:Z  compass-compilation

xauth nlist ${DISPLAY} | sed -e 's/^..../ffff/' | xauth -f ${XAUTH} nmerge - &&\
    docker run \
	   -it \
	   --rm \
	   --network=host \
	   -m 20G \
	   -e DISPLAY=${DISPLAY} \
	   -e LC_ALL=en_US.utf8 \
	   -v ${XAUTH}:${XAUTH}:Z \
	   -v ${XSOCK}:${XSOCK}:Z \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
	   -v ${HOME}/apps:/root/apps:Z \
	   -v ${HOME}/.ccache:/root/.ccache:Z \
	   -v ${HOME}/.emacs.d:/root/.emacs.d:Z \
           -v ${HOME}/.ssh:/root/.ssh \
	   -v ${HOME}/.gitconfig:/root/.gitconfig \
	   -v ${HOME}/apps/ttf:/root/.local/fonts \
           -v ${HOME}/usr:/root/usr:Z \
           -v /opt/Qt:/opt/qt_complete \
           --ipc="host"\
	   --privileged \
           --device=/dev/nvidiactl --device=/dev/nvidia-uvm --device=/dev/nvidia0\
	   ubuntu:felgo
