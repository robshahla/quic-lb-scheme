#!/bin/bash

export CONTAINER_NAME=my-running-proxygen

docker rm $CONTAINER_NAME -f

docker build -t my-proxygen-new .

docker network create --ipv6 --subnet=2001:db8:2::/64 --subnet="172.18.0.0/16" quic-network
#docker network create --subnet="2001:db8:2::/64" --gateway="2001:db8:2::1" --ipv6 scheme-network

docker run --cap-add NET_ADMIN --net scheme-network --ip [2001:db8:2::2] -v $(pwd):/usr/src/proxygen -p [2001:db8:2::2]:6666:6666/udp \
-d --name $CONTAINER_NAME my-proxygen-new

echo ----------------------------
echo showing logs
echo ----------------------------
docker logs -f --since=3s $CONTAINER_NAME
echo ----------------------------

sleep
#curl 0.0.0.0:8080

