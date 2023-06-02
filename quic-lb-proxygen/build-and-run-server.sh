#!/bin/bash

cd /usr/src/proxygen/proxygen
./build.sh -j 2 --with-quic
./install.sh

cd /usr/src/proxygen/proxygen/_build/proxygen/httpserver
mkdir qlogs

ip route del default
ip route add default via 172.18.1.2 #ip address of the docker container that will return traffic to clients

#./hq --mode=server --qlogger_path=./qlogs --host=2001:db8:2::3 --port=6666
#./hq --mode=server --qlogger_path=./qlogs --host=172.18.0.2 --port=6666 --early_data=true
./proxygen/proxygen/_build/proxygen/httpserver/hq --mode=client --host=172.19.1.2 --port=8888 --path=10,20,30 --early_data=true --qlogger_path=.

#talk to server:
./hq --mode=client --host=2001:db8:2::3 --port=6666


#ip r a 172.18.0.0/16 via 172.19.1.2 dev eth0 onlink in case the command in docker-compose.yml does not work
