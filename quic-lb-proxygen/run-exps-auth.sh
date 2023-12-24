#!/bin/bash
# TODO: add a new name (files and directories for the experiment with client authentication. the relevant command for the server
# to authenticate the client is in the server-command.sh file.)
# TODO: run I15-P170 and above
# TODO: run I17-P15 and above
docker-compose up -d my-running-client my-proxygen-server-0
# for iteration in {1..11}
# for iteration in {18..34}
for iteration in 15 17
do
    # for processes in 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200 300 400
    for processes in 1 5 10 15 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200
    do
        base_name=v3-parallel-I${iteration}-P${processes}-C
        echo "running the experiment with ${processes} v2-parallel processes, iteration ${iteration}"
        for mode in 1_rtt_auth
        do
            docker-compose restart my-running-client my-proxygen-server-0
            sleep 30
            echo "running the server"
            docker exec -d -t -w /usr/src/ my-proxygen-server-0 bash -c "pkill -f hq"
            docker exec -d -t -w /usr/src/ my-proxygen-server-0 bash -c "./proxygen/server-command.sh ${base_name} ${mode}" > /dev/null
            # docker exec -d -t -w /usr/src/ my-proxygen-server-0 bash -c "perf stat -o proxygen/perf-data/perf-${base_name}${mode}-server.data -x, -v -e instructions,cycles,cache-misses,cache-references,ref-cycles,mem-loads,mem-stores,page-faults,cpu-clock -a -C 8-11 ./proxygen/proxygen/_build/proxygen/httpserver/hq --mode=server --host=172.18.2.2 --port=6666 --early_data=true --psk_file=./psk.txt --protocol=h3 --cert=/etc/ssl/certs/server.crt --key=/etc/ssl/private/server.key" > /dev/null
            # docker exec -d -t -w /usr/src/ my-proxygen-server-0 bash -c "./proxygen/proxygen/_build/proxygen/httpserver/hq --mode=server --host=172.18.2.2 --port=6666 --early_data=true --psk_file=./psk.txt --protocol=h3 --cert=/etc/ssl/certs/server.crt --key=/etc/ssl/private/server.key & perf stat -o proxygen/perf-data/perf-${base_name}${mode}-server.data -x, -v -e instructions,cycles,cache-misses,cache-references,ref-cycles,mem-loads,mem-stores,page-faults,cpu-clock -p ${!} ./proxygen/wait-for-process.sh ${!}" > /dev/null
            # docker exec -t -w /usr/src/ my-proxygen-server-0 bash -c "./proxygen/proxygen/_build/proxygen/httpserver/hq --mode=server --host=172.18.2.2 --port=6666 --early_data=true --psk_file=./psk.txt --protocol=h3 --cert=/etc/ssl/certs/server.crt --key=/etc/ssl/private/server.key & perf stat -o proxygen/perf-data/perf-${base_name}${mode}-server.data -x, -v -e instructions,cycles,cache-misses,cache-references,ref-cycles,mem-loads,mem-stores,page-faults,cpu-clock -p ${!} ./proxygen/wait-for-process.sh ${!}"
            echo "sleeping for 30 seconds"
            sleep 30
            docker exec -d -t -w /usr/src/proxygen my-running-client bash -c "pkill -f hq"
            echo "running the client"
            # docker exec -t -w /usr/src/proxygen my-running-client bash -c "perf stat -o perf-data/perf-${base_name}${mode}.data -x, -v -e instructions,cycles,cache-misses,cache-references,ref-cycles,mem-loads,mem-stores,page-faults,cpu-clock -a -C 0-7 python3 run-0-rtt-exp.py ${mode} ${processes} ${base_name}${mode} && chmod 777 -R ${base_name}${mode} perf-${base_name}${mode}.data perf-${base_name}${mode}-server.data" > ${base_name}-run.logs
            # docker exec -t -w /usr/src/proxygen my-running-client bash -c "python3 run-0-rtt-exp.py ${mode} ${processes} ${base_name}${mode} & perf stat -o perf-data/perf-${base_name}${mode}.data -x, -v -e instructions,cycles,cache-misses,cache-references,ref-cycles,mem-loads,mem-stores,page-faults,cpu-clock -p ${!} ./wait-for-process.sh ${!}" > ${base_name}-run.logs
            docker exec -t -w /usr/src/proxygen my-running-client bash -c "./client-command.sh ${mode} ${processes} ${base_name}" > ${base_name}-run.logs
            docker exec -t -w /usr/src/proxygen my-running-client bash -c "chmod 777 -R ${base_name}${mode} perf-${base_name}${mode}.data perf-${base_name}${mode}-server.data" > ${base_name}-run.logs
            echo "finished the client"
            sleep 5
            docker exec -d -t -w /usr/src/ my-proxygen-server-0 bash -c "pkill -f hq --signal SIGINT"
        done
        # docker exec -t -w /usr/src/proxygen my-running-client bash -c 'perf stat -o perf-v2-parallel-I${processes}-P1-C1_rtt.data -x, -v -e instructions,cycles,cache-misses,cache-references,ref-cycles,mem-loads,mem-stores,page-faults,cpu-clock python3 run-0-rtt-exp.py 1_rtt 1 v2-parallel-P1-C1_rtt && chmod 777 -R v2-parallel-P1-C1_rtt perf-v2-parallel-P1-C1_rtt.data' > 1-I$processes-run.logs
        # TODO: add stopping and starting the client and server containers for each iteration
        # TODO: add perf at the server side and ake sure it saves the output and works as expected.
        # echo analyzing the qlog files
        # python3 ./0-rtt-exp.py ${base_name}

        echo "zipping the qlog files"
        for i in v3-*_rtt_auth; do 
            zip -Tmr "${i%/}.zip" "$i" &
        done
        wait < <(jobs -p)
        
        echo "moving the zip file to home_nfs"
        for i in v3-*_auth.zip; do 
            mv "${i%/}" /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen & 
        done
        wait < <(jobs -p)
        # zip -r ${base_name}0_rtt.zip ${base_name}0_rtt | tail -n 5
        # mv ${base_name}0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

        # echo "zipping the qlog files"
        # zip -r ${base_name}1_rtt.zip ${base_name}1_rtt | tail -n 5

        # echo "moving the zip file to home_nfs"
        # mv ${base_name}1_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

        # zip -r ${base_name}-run.logs.zip ${base_name}-run.logs
        # mv ${base_name}-run.logs.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

        # rm ${base_name}-run.logs
        # rm -rf ${base_name}0_rtt
        # rm -rf ${base_name}1_rtt

        echo "================done================"
    done
done