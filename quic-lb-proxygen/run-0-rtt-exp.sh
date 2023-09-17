#!/bin/bash
export NUM_OF_ITERATION=$2
export QLOGDIR=$3

# check if $1 is set to 0-rtt or 1-rtt
if [ "$1" == "0_rtt" ]; then
    # run the following command for NUM_OF_ITERATION times:
    echo "Running $NUM_OF_ITERATION iterations of the experiment using 0-RTT"
    for i in $(seq 1 $NUM_OF_ITERATION)
    do
        # run the following command to send a request to the server:
        echo "Iteration $i"
        ./proxygen/_build/proxygen/httpserver/hq --mode=client --host=172.18.2.2 --port=6666 --path=/10 --qlogger_path=./$QLOGDIR --sequential=true --protocol=h3 --cert=/etc/ssl/certs/server.crt --key=/etc/ssl/private/server.key --early_data=true --psk_file=./psk.txt
    done
elif [ "$1" == "1_rtt" ]; then
    echo "Running $NUM_OF_ITERATION iterations of the experiment without using 0-RTT"
    for i in $(seq 1 $NUM_OF_ITERATION)
    do
        # run the following command to send a request to the server:
        echo "Iteration $i"
        ./proxygen/_build/proxygen/httpserver/hq --mode=client --host=172.18.2.2 --port=6666 --path=/10 --qlogger_path=./$QLOGDIR --sequential=true --protocol=h3 --cert=/etc/ssl/certs/server.crt --key=/etc/ssl/private/server.key
    done
fi


# run the same experiment as above, but with 20 parallel processes, each sending NUM_OF_ITERATION/20 requests
# export PARALLEL=20
# echo "Running $NUM_OF_ITERATION iterations of the experiment using 0-RTT with $PARALLEL parallel processes"
# for i in $(seq 1 $PARALLEL)
# do
#     for j in $(seq 1 $((NUM_OF_ITERATION/PARALLEL)))
#     do
#         echo "Iteration $i"
#         ./proxygen/_build/proxygen/httpserver/hq --mode=client --host=



