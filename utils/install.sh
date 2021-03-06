#!/bin/bash

TAG=v0.2.3-alpha
VERSION=0.2.3-alpha
MAPLE_ZIP=maple-$VERSION

function install_maple {
    # Install latest maple runtime
    # rm -rf $MAPLE_ZIP $MAPLE_ZIP.zip
    curl -L -o /tmp/$MAPLE_ZIP.zip https://github.com/snlab/Maple-release/releases/download/$TAG/$MAPLE_ZIP.zip
    #cd /tmp
    rm -rf $HOME/$MAPLE_ZIP $HOME/.maple
    unzip /tmp/$MAPLE_ZIP.zip -d $HOME/
    mv $HOME/$MAPLE_ZIP $HOME/.maple
    # mkdir -p $HOME/.maple
    # cp -r /tmp/$MAPLE_ZIP/* $HOME/.maple/
}

function install_maple_lib {
    # Install library for compile time dependencies
    curl -L -o /tmp/m2.zip https://github.com/snlab/Maple-release/releases/download/$TAG/m2.zip
    mkdir -p $HOME/.m2
    cd $HOME/.m2
    unzip -o /tmp/m2.zip
}

install_maple
install_maple_lib


