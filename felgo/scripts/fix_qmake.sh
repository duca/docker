#!/bin/bash
if [ -f /usr/bin/qmake-qt5 ]; then
    mv /usr/bin/qmake-qt5 /usr/bin/qmake-5.9;
fi

update-alternatives --install /usr/bin/qmake-qt5 qmake-qt5 /usr/bin/qmake-5.9 10
update-alternatives --install /usr/bin/qmake-qt5 qmake-qt5 /opt/qt5/bin/qmake 20
update-alternatives --install /usr/bin/qmake5 qmake5 /opt/qt5/bin/qmake 20
