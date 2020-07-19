#!/bin/bash

# set -e
source ${HOME}/.bashrc

cd ${HOME}/emacs;
git pull
mkdir build;
./autogen.sh;
cd build;
../configure --with-modules --with-threads --with-x-toolkit=lucid --enable-link-time-optimization --without-makeinfo CFLAGS="-O3 -funroll-all-loops -ftree-vectorize";
scl-run make -j4 all
