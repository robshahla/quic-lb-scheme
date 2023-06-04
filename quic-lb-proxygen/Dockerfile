FROM ubuntu:18.04

WORKDIR /usr/src

COPY . /usr/src/proxygen

RUN apt-get update; \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    sudo \
    curl \
    git \
    vim

RUN cd /usr/src/proxygen/proxygen; \
    ./build.sh -j 2 --with-quic; \
    ./install.sh;