#!/bin/bash
# docker exec -t -w /usr/src/proxygen my-proxygen-server-0 bash -c 'python3 run-0-rtt-exp.py 0_rtt 15 && chmod 777 -R parallel-P15-C0_rtt parallel-P15-C1_rtt' > 15-run.logs
# docker exec -t -w /usr/src/proxygen my-proxygen-server-0 bash -c 'python3 run-0-rtt-exp.py 0_rtt 20 && chmod 777 -R parallel-P20-C0_rtt parallel-P20-C1_rtt' > 20-run.logs
# docker exec -t -w /usr/src/proxygen my-proxygen-server-0 bash -c 'python3 run-0-rtt-exp.py 0_rtt 30 && chmod 777 -R parallel-P30-C0_rtt parallel-P30-C1_rtt' > 30-run.logs
# docker exec -t -w /usr/src/proxygen my-proxygen-server-0 bash -c 'python3 run-0-rtt-exp.py 0_rtt 60 && chmod 777 -R parallel-P60-C0_rtt parallel-P60-C1_rtt' > 60-run.logs
# docker exec -t -w /usr/src/proxygen my-proxygen-server-0 bash -c 'python3 run-0-rtt-exp.py 0_rtt 100 && chmod 777 -R parallel-P100-C0_rtt parallel-P100-C1_rtt' > 100-run.logs
# docker exec -t -w /usr/src/proxygen my-proxygen-server-0 bash -c 'python3 run-0-rtt-exp.py 0_rtt 200 && chmod 777 -R parallel-P200-C0_rtt parallel-P200-C1_rtt' > 200-run.logs

# unzip parallel-P30-C1_rtt.zip
# unzip parallel-P30-C0_rtt.zip -d parallel-P30-C0_rtt/
# find parallel-P30-C0_rtt/parallel-P30-C0_rtt/ -name "*.qlog" -type f -exec sh -c 'mv "$@" "$0"' parallel-P30-C0_rtt/ {} +
# rm -rf parallel-P30-C0_rtt/parallel-P30-C0_rtt/
# python3 ./0-rtt-exp.py parallel-P30-C
# zip -r parallel-P30-C0_rtt.zip parallel-P30-C0_rtt
# mv parallel-P30-C0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen
# rm -r parallel-P30-C0_rtt
# rm -r parallel-P30-C1_rtt parallel-P30-C1_rtt.zip

unzip parallel-P60-C1_rtt.zip
unzip parallel-P60-C0_rtt.zip -d parallel-P60-C0_rtt/
find parallel-P60-C0_rtt/parallel-P60-C0_rtt/ -name "*.qlog" -type f -exec sh -c 'mv "$@" "$0"' parallel-P60-C0_rtt/ {} +
rm -rf parallel-P60-C0_rtt/parallel-P60-C0_rtt/
python3 ./0-rtt-exp.py parallel-P60-C
zip -r parallel-P60-C0_rtt.zip parallel-P60-C0_rtt
mv parallel-P60-C0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen
rm -r parallel-P60-C0_rtt
rm -r parallel-P60-C1_rtt parallel-P60-C1_rtt.zip

unzip parallel-P100-C1_rtt.zip
unzip parallel-P100-C0_rtt.zip -d parallel-P100-C0_rtt/
find parallel-P100-C0_rtt/parallel-P100-C0_rtt/ -name "*.qlog" -type f -exec sh -c 'mv "$@" "$0"' parallel-P100-C0_rtt/ {} +
rm -rf parallel-P100-C0_rtt/parallel-P100-C0_rtt/
python3 ./0-rtt-exp.py parallel-P100-C
zip -r parallel-P100-C0_rtt.zip parallel-P100-C0_rtt
mv parallel-P100-C0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen
rm -r parallel-P100-C0_rtt
rm -r parallel-P100-C1_rtt parallel-P100-C1_rtt.zip

unzip parallel-P200-C1_rtt.zip
unzip parallel-P200-C0_rtt.zip -d parallel-P200-C0_rtt/
find parallel-P200-C0_rtt/parallel-P200-C0_rtt/ -name "*.qlog" -type f -exec sh -c 'mv "$@" "$0"' parallel-P200-C0_rtt/ {} +
rm -rf parallel-P200-C0_rtt/parallel-P200-C0_rtt/
python3 ./0-rtt-exp.py parallel-P200-C
zip -r parallel-P200-C0_rtt.zip parallel-P200-C0_rtt
mv parallel-P200-C0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen
rm -r parallel-P200-C0_rtt
rm -r parallel-P200-C1_rtt parallel-P200-C1_rtt.zip