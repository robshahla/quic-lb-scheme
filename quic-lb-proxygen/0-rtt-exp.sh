#!/bin/bash
export NUM_OF_ITERATION=1000

# run the following command for NUM_OF_ITERATION times:
echo "Running $NUM_OF_ITERATION iterations of the experiment using 0-RTT"
for i in $(seq 1 $NUM_OF_ITERATION)
do
    # run the following command to send a request to the server:
    echo "Iteration $i"
    ./proxygen/proxygen/_build/proxygen/httpserver/hq --mode=client --host=172.18.2.2 --port=6666 --path=/10 --qlogger_path=./proxygen/0-rtt-qlogs/ --sequential=true --protocol=h3 --cert=/etc/ssl/certs/server.crt --key=/etc/ssl/private/server.key --early_data=true --psk_file=./psk.txt
done

echo "Running $NUM_OF_ITERATION iterations of the experiment without using 0-RTT"
for i in $(seq 1 $NUM_OF_ITERATION)
do
    # run the following command to send a request to the server:
    echo "Iteration $i"
    ./proxygen/proxygen/_build/proxygen/httpserver/hq --mode=client --host=172.18.2.2 --port=6666 --path=/10 --qlogger_path=./proxygen/1-rtt-qlogs/ --sequential=true --protocol=h3 --cert=/etc/ssl/certs/server.crt --key=/etc/ssl/private/server.key
done


