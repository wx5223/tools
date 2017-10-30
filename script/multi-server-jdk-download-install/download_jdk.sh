#!/bin/bash
## Defaults: jdk|jdk_version: 8 / tar.gz

ADMIN_EMAIL=""
# type can be jre or jdk
JAVA_TYPE="jdk"
JAVA_VERSION="8"
EXT="tar.gz"

# set default if suggested
if [[ -n "$1" ]]; then
  if [[ "$1" == "7" ]]; then
   JAVA_VERSION="7"
  fi
fi

# set download extension
if [[ -n "$2" ]]; then
  if [[ "$2" == "tar" ]]; then
    EXT="tar.gz"
  fi
fi

# set base download location
URL="http://www.oracle.com"
DOWNLOAD_URL1="${URL}/technetwork/java/javase/downloads/index.html"
DOWNLOAD_URL2=$(curl -s $DOWNLOAD_URL1 | egrep -o "\/technetwork\/java/\javase\/downloads\/${JAVA_TYPE}${JAVA_VERSION}-downloads-.*\.html" | head -1)

# check to make sure we got to oracle
if [[ -z "$DOWNLOAD_URL2" ]]; then
  echo "Could not to oracle - $DOWNLOAD_URL1"
  exit 1
fi

# set download url
DOWNLOAD_URL3="$(echo ${URL}${DOWNLOAD_URL2}|awk -F\" {'print $1'})"
DOWNLOAD_URL4=$(curl -s "$DOWNLOAD_URL3" | egrep -o "http\:\/\/download.oracle\.com\/otn-pub\/java\/jdk\/[7-8]u[0-9]+\-(.*)+\/${JAVA_TYPE}-[7-8]u[0-9]+(.*)linux-x64.${EXT}"|tail -n1)

# check to make sure url exists
if [[ -z "$DOWNLOAD_URL4" ]]; then
  echo "Could not get ${JAVA_TYPE} download url - $DOWNLOAD_URL4"
  exit 1
fi
# set download file name
JAVA_INSTALL=$(basename $DOWNLOAD_URL4)

# download java
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" $DOWNLOAD_URL4  -O $JAVA_INSTALL 
# end script
