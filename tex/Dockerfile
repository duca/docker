FROM opensuse/tumbleweed

MAINTAINER Eduardo Lopes <elopes1@oceaneering.com>

# install latex packages
ADD conf/packages.dat /root/
RUN zypper ref
RUN zypper up -y
RUN cat /root/packages.dat | xargs zypper in -y
RUN zypper in -y pandoc

# will ease up the update process
# updating this env variable will trigger the automatic build of the Docker image
ENV PANDOC_VERSION "1.19.2.1"
WORKDIR "/source"   
# install pandoc
# RUN cabal update && cabal install pandoc-${PANDOC_VERSION}
# ENTRYPOINT ["pdflatex"]
# ENTRYPOINT ["ls"]
# CMD ["--help"]
