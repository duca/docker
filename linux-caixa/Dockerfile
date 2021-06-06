##########################################################
#
# Projeto Saber M200 - montagem do ambiente de compilacao
#
##########################################################

# https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images

FROM ubuntu:20.04
MAINTAINER Eduardo Lopes

ARG UID=1000
ARG GID=1000
USER root

# #######ID repository
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y fonts-hack fonts-freefont-otf libnss3-tools wget firefox libnotify4 zenity-common libwebkit2gtk-4.0-37
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN DEBIAN_FRONTEND=noninteractive apt install -y ./google-chrome-stable_current_amd64.deb 

# #################################################
# System configuration
RUN groupadd docker -g ${GID}
RUN groupadd wheel
RUN useradd usuario -u ${UID} -g ${GID} -m
RUN echo usuario:usuario | chpasswd
RUN echo root:RootRunner | chpasswd
RUN chown -R usuario /home/usuario
RUN gpasswd -a usuario wheel
ADD home/Downloads/GBPCEFwr64.deb /data/GBPCEFwr64.deb
RUN dpkg -i /data/GBPCEFwr64.deb

# ######################################################################################
# RUN pip3.6 install compiledb
# #######################################################################################
# finalizing

USER usuario
EXPOSE 22/tcp
WORKDIR "/home/usuario"
# ENTRYPOINT ["/home/centos/centos_dev.sh"]
# #####################################################################################
# Auto UID and GID adjuster
