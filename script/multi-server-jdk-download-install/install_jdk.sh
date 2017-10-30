#!/bin/bash
INSTALL_PATH=/usr/java

mkdir -p $INSTALL_PATH
if ls jdk*.tar.gz >/dev/null 2>&1;then
tar xzf jdk*.tar.gz -C $INSTALL_PATH > /dev/null 2>&1
JAVA_DIR=$(ls -tr $INSTALL_PATH|grep jdk|head -n 1)
echo $INSTALL_PATH/$JAVA_DIR
export JAVA_HOME=$INSTALL_PATH/$JAVA_DIR
export PATH=$PATH:$INSTALL_PATH/$JAVA_DIR/bin:$INSTALL_PATH/$JAVA_DIR/jdk/bin
echo "export JAVA_HOME=$INSTALL_PATH/$JAVA_DIR" >> /etc/environment
echo "export PATH=$PATH:$INSTALL_PATH/$JAVA_DIR/bin:$INSTALL_PATH/$JAVA_DIR/jdk/bin" >> /etc/environment
source /etc/environment
echo "environment export into /etc/environment"
fi


