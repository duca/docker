##########################################################
#
# Projeto Saber M200 - montagem do ambiente de compilacao
#
##########################################################

# https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images

# FROM centos:7
FROM dev:centos7
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

# ##################################################################
# emacs packages
ADD conf/emacs_packages.dat /root/emacs_packages.dat
RUN cat /root/emacs_packages.dat | xargs yum --nogpgcheck -y install

RUN yum --nogpgcheck -y update

# ######################################################################################
# adjusting environment
USER root
ADD conf/hack_font /home/compass/.fonts
RUN chown -R centos:docker /home/centos/*

USER centos
RUN ls -lah /home/centos
RUN fc-cache-64 -f
# Installing Emacs
# RUN cd /home/centos/ && rm -rf emacs && git clone --depth=1 https://git.savannah.gnu.org/git/emacs.git
# ADD scripts/compile_emacs.sh /home/centos/emacs/
# RUN /home/centos/emacs/compile_emacs.sh
# USER root
# RUN cd /home/centos/emacs/build && make install -j4
# ######################################################################################
# Remacs experiments
USER root
ADD scripts/rust.sh /root/rust.sh
RUN /root/rust.sh
RUN cd /root/ && rm -rf remacs && git clone --depth=1 https://github.com/remacs/remacs.git remacs
ADD scripts/remacs.sh /root/remacs/remacs.sh
RUN cd /root/remacs && ./remacs.sh
# #####################################################################################
# finalizing
USER centos
WORKDIR "/home/centos/work"
EXPOSE 9022/tcp 9022/udp
ENTRYPOINT ["/home/centos/centos_dev.sh"]
# #####################################################################################
