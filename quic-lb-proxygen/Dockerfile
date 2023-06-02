FROM ubuntu:18.04

WORKDIR /usr/src


RUN apt-get update; \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    sudo \
    curl \
    git \
    vim \
    net-tools \
    iproute2

RUN mkdir -p /usr/src/proxygen

COPY ./build-and-run-server.sh /usr/src

RUN chmod 777 /usr/src/build-and-run-server.sh

CMD ./build-and-run-server.sh

# todo: change this to copy only the necessary files
#COPY . /usr/src/proxygen

#RUN cd /usr/src/proxygen/proxygen; \
#    ./build.sh -j 2 --with-quic; \
#    ./install.sh;
#
#RUN cd /usr/src/proxygen/proxygen/_build/proxygen/httpserver; \
#    mkdir qlogs; \
#    ./hq --mode=server --qlogger_path=./qlogs;

#EXPOSE 6666/udp



#RUN mkdir -p /usr/src/openssl-quic; \
#    curl -L https://github.com/quictls/openssl/archive/refs/tags/openssl-3.0.8-quic1.tar.gz; \
#    tar -xzf openssl-3.0.8-quic1.tar.gz -C /usr/src/openssl-quic; \
#    cd /usr/src/openssl-quic/openssl-openssl-3.0.8-quic1; \
#    ./Configure; \
#    make; \
#    sudo make install; \
#

#mkdir -p /usr/src/proxygen; \
#tar -xzf proxygen-v2023.05.22.00.tar.gz -C /usr/src/proxygen; \

# use v2023.05.01.00
#git clone --branch v2023.05.01.00 https://github.com/facebook/folly.git
#git clone --branch v2023.05.01.00 https://github.com/facebook/proxygen.git


# to run the QUIC server, one should enable the ipv6 in docker, this can be done
# by adding the following line to /etc/docker/daemon.json:
# {
#   "ipv6": true,
#   "fixed-cidr-v6": "2001:db8:1::/64"
# }