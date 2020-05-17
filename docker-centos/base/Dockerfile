##########################################################
#
# Projeto Saber M200 - montagem do ambiente de compilacao
#
##########################################################

# https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images

FROM centos:7
MAINTAINER Eduardo Lopes

ARG UID=1000
ARG GID=1000
USER root
# #######ID repository
#RUN yum --nogpgcheck -y update
# RUN wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && rpm -ivh epel-release-latest-7.noarch.rpm
RUN yum install --nogpgcheck -y epel-release
RUN yum install --nogpgcheck -y centos-release-scl

RUN yum clean all
RUN yum makecache fast

# Ordinary packages
ADD conf/packages_list.dat /root/packages_list.dat
RUN cat /root/packages_list.dat | xargs yum --nogpgcheck -y install

ADD conf/qt_packages.dat /root/qt_packages.dat
RUN cat /root/qt_packages.dat | xargs yum --nogpgcheck --skip-broken -y install

RUN yum --nogpgcheck -y update

RUN pip3 install --upgrade pip
# #################################################
# System configuration
USER root
RUN systemctl enable sshd
EXPOSE 22/tcp

# ######################################################################################
# Adjusting users
RUN groupadd docker -g ${GID}
RUN useradd centos -u ${UID} -g ${GID}
# RUN update-alternatives --install /usr/bin/qmake-qt5 qmake-qt5 /opt/qt5/bin/qmake 10
RUN update-alternatives --install /usr/bin/qmake qmake /opt/qt5/bin/qmake 10

# ######################################################################################
# adjusting environment
ADD scripts/fix_ccache.sh /root
RUN /root/fix_ccache.sh
ADD scripts/fix_qmake.sh /root
RUN /root/fix_qmake.sh

USER centos
RUN pip3.6 install compiledb
# #######################################################################################
# finalizing
WORKDIR "/home/centos/work"
ENTRYPOINT ["/home/centos/centos_dev.sh"]
# #####################################################################################
# Auto UID and GID adjuster
