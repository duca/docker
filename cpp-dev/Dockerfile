FROM opensuse/tumbleweed

MAINTAINER Eduardo Lopes <elopes1@oceaneering.com>

# install latex packages
ADD conf/texlive_packages.dat /root/
ADD conf/repos.d /etc/zypp/repos.d
RUN zypper ref
RUN zypper up -y
RUN cat /root/texlive_packages.dat | xargs zypper in -y -d
RUN cat /root/texlive_packages.dat | xargs zypper in -y
RUN zypper in -y pandoc

# will ease up the update process
# updating this env variable will trigger the automatic build of the Docker image
ENV PANDOC_VERSION "1.19.2.1"
RUN useradd pandoc -u 1000 && echo 'pandoc:pandoc' | chpasswd

# install pandoc
# RUN cabal update && cabal install pandoc-${PANDOC_VERSION}
RUN mkdir /source
RUN chown -R pandoc source
USER pandoc
# ENTRYPOINT ["/root/.cabal/bin/pandoc"]
WORKDIR /source
# ENTRYPOINT ["ls"]
# CMD ["--help"]
