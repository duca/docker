FROM ubuntu:18.04

MAINTAINER Eduardo Lopes <elopes1@oceaneering.com>

# install latex packages
RUN apt-get update -y \
  && apt-get install -y -o Acquire::Retries=10 --no-install-recommends \
        texlive-xetex\
        texlive-luatex\
        texlive-fonts-extra\
        texlive-font-utils\
        texlive-bibtex-extra\
        texlive-extra-utils\
        texlive-pstricks\
        texlive-science\
        texlive-lang-portuguese\
        texlive-lang-english\
        texlive-lang-european\
        fontconfig \
        pandoc\
        lmodern

# will ease up the update process
# updating this env variable will trigger the automatic build of the Docker image
ENV PANDOC_VERSION "1.19.2.1"
RUN useradd pandoc -u 1000 && echo 'pandoc:pandoc' | chpasswd

# install pandoc
# RUN cabal update && cabal install pandoc-${PANDOC_VERSION}

WORKDIR /source

# ENTRYPOINT ["/root/.cabal/bin/pandoc"]
ENTRYPOINT ["bash"]
# CMD ["--help"]
