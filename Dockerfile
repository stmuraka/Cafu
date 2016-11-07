FROM ubuntu:xenial
MAINTAINER Shaun Murakami <stmuraka@us.ibm.com>

# Install components
RUN apt-get -y update \
 && apt-get -y install \
        apt-utils \
        libgtk2.0-0 \
        libgl1-mesa-glx \
        libsm6 \
# Cleanup package files
 && apt-get autoremove  \
 && apt-get autoclean

WORKDIR /root/
ARG CAFU_BIN
ENV CAFU_BIN ${GAME_DOWNLOAD:-"http://www.cafu.de/files/Cafu-bin-2013-04-27-9e48f96-linux2-x86_64.tar.gz"}
ADD ${CAFU_BIN} /root/

RUN tar -zxvf $(basename ${CAFU_BIN})

CMD cd Cafu*; ./Cafu
