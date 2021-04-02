##########################################################
#
# Projeto Saber M200 - montagem do ambiente de compilacao
#
##########################################################

# https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images

FROM ubuntu:18.04
MAINTAINER Eduardo Lopes

ARG UID=1000
ARG GID=1000
USER root
# #######ID repository
#RUN yum --nogpgcheck -y update
# RUN wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && rpm -ivh epel-release-latest-7.noarch.rpm
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y libcurl-openssl1.0-dev openssl1.0 openssl libcrypto++6 libfontconfig g++ libglu1-mesa-dev libpulse-dev libglib2.0-dev gdb build-essential module-init-tools libxkbcommon-x11-0 xcb libxrender1

# Ordinary packages
# ADD conf/packages_list.dat /root/packages_list.dat
# RUN cat /root/packages_list.dat | xargs yum --nogpgcheck -y install

# ADD conf/qt_packages.dat /root/qt_packages.dat
# RUN cat /root/qt_packages.dat | xargs yum --nogpgcheck --skip-broken -y install

# #################################################
# System configuration
USER root
#RUN systemctl enable sshd
EXPOSE 22/tcp

# ######################################################################################
# Adjusting users
# RUN groupadd docker -g ${GID}
# RUN useradd centos -u ${UID} -g ${GID}
# RUN update-alternatives --install /usr/bin/qmake-qt5 qmake-qt5 /opt/qt5/bin/qmake 10
# RUN update-alternatives --install /usr/bin/qmake qmake /opt/qt5/bin/qmake 10

# ######################################################################################
# adjusting environment
# ADD scripts/fix_ccache.sh /root
# RUN /root/fix_ccache.sh
# ADD scripts/fix_qmake.sh /root
#RUN /root/fix_qmake.sh

# USER centos
# RUN pip3.6 install compiledb
# #######################################################################################
# finalizing
# WORKDIR "/home/centos/work"
# ENTRYPOINT ["/home/centos/centos_dev.sh"]
# #####################################################################################
# Auto UID and GID adjuster
