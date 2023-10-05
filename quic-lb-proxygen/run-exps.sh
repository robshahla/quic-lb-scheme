echo "running the experiment with 1 v2-parallel processes"
docker exec -t -w /usr/src/proxygen my-running-client bash -c 'python3 run-0-rtt-exp.py 0_rtt 1 && chmod 777 -R v2-parallel-P1-C0_rtt v2-parallel-P1-C1_rtt' > 1-run.logs

echo analyzing the qlog files
python3 ./0-rtt-exp.py v2-parallel-P1-C

echo "zipping the qlog files"
zip -r v2-parallel-P1-C0_rtt.zip v2-parallel-P1-C0_rtt | tail -n 5

echo "moving the zip file to home_nfs"
mv v2-parallel-P1-C0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

echo "zipping the qlog files"
zip -r v2-parallel-P1-C1_rtt.zip v2-parallel-P1-C1_rtt | tail -n 5

echo "moving the zip file to home_nfs"
mv v2-parallel-P1-C1_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

zip -r 1-run.logs.zip 1-run.logs
mv 1-run.logs.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

rm 1-run.logs
rm -rf v2-parallel-P1-C0_rtt
rm -rf v2-parallel-P1-C1_rtt

echo "================done================"
# echo "running the experiment with 5 v2-parallel processes"
# docker exec -t -w /usr/src/proxygen my-running-client bash -c 'python3 run-0-rtt-exp.py 0_rtt 5 && chmod 777 -R v2-parallel-P5-C0_rtt v2-parallel-P5-C1_rtt' > 5-run.logs

# echo analyzing the qlog files
# python3 ./0-rtt-exp.py v2-parallel-P5-C

# echo "zipping the qlog files"
# zip -r v2-parallel-P5-C0_rtt.zip v2-parallel-P5-C0_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P5-C0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# echo "zipping the qlog files"
# zip -r v2-parallel-P5-C1_rtt.zip v2-parallel-P5-C1_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P5-C1_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# zip -r 5-run.logs.zip 5-run.logs
# mv 5-run.logs.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# rm 5-run.logs
# rm -rf v2-parallel-P5-C0_rtt
# rm -rf v2-parallel-P5-C1_rtt

# echo "================done================"
# echo "running the experiment with 10 v2-parallel processes"
# docker exec -t -w /usr/src/proxygen my-running-client bash -c 'python3 run-0-rtt-exp.py 0_rtt 10 && chmod 777 -R v2-parallel-P10-C0_rtt v2-parallel-P10-C1_rtt' > 10-run.logs

# echo analyzing the qlog files
# python3 ./0-rtt-exp.py v2-parallel-P10-C

# echo "zipping the qlog files"
# zip -r v2-parallel-P10-C0_rtt.zip v2-parallel-P10-C0_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P10-C0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# echo "zipping the qlog files"
# zip -r v2-parallel-P10-C1_rtt.zip v2-parallel-P10-C1_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P10-C1_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# zip -r 10-run.logs.zip 10-run.logs
# mv 10-run.logs.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# rm 10-run.logs
# rm -rf v2-parallel-P10-C0_rtt
# rm -rf v2-parallel-P10-C1_rtt

# echo "================done================"

# echo "running the experiment with 15 v2-parallel processes"
# docker exec -t -w /usr/src/proxygen my-running-client bash -c 'python3 run-0-rtt-exp.py 0_rtt 15 && chmod 777 -R v2-parallel-P15-C0_rtt v2-parallel-P15-C1_rtt' > 15-run.logs

# echo analyzing the qlog files
# python3 ./0-rtt-exp.py v2-parallel-P15-C

# echo "zipping the qlog files"
# zip -r v2-parallel-P15-C0_rtt.zip v2-parallel-P15-C0_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P15-C0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# echo "zipping the qlog files"
# zip -r v2-parallel-P15-C1_rtt.zip v2-parallel-P15-C1_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P15-C1_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# zip -r 15-run.logs.zip 15-run.logs
# mv 15-run.logs.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# rm 15-run.logs
# rm -rf v2-parallel-P15-C0_rtt
# rm -rf v2-parallel-P15-C1_rtt

# echo "================done================"

# echo "running the experiment with 20 v2-parallel processes"
# docker exec -t -w /usr/src/proxygen my-running-client bash -c 'python3 run-0-rtt-exp.py 0_rtt 20 && chmod 777 -R v2-parallel-P20-C0_rtt v2-parallel-P20-C1_rtt' > 20-run.logs

# echo analyzing the qlog files
# python3 ./0-rtt-exp.py v2-parallel-P20-C

# echo "zipping the qlog files"
# zip -r v2-parallel-P20-C0_rtt.zip v2-parallel-P20-C0_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P20-C0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# echo "zipping the qlog files"
# zip -r v2-parallel-P20-C1_rtt.zip v2-parallel-P20-C1_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P20-C1_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen
# zip -r 20-run.logs.zip 20-run.logs
# mv 20-run.logs.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# rm 20-run.logs
# rm -rf v2-parallel-P20-C0_rtt
# rm -rf v2-parallel-P20-C1_rtt

# echo "================done================"
# echo "running the experiment with 30 v2-parallel processes"
# docker exec -t -w /usr/src/proxygen my-running-client bash -c 'python3 run-0-rtt-exp.py 0_rtt 30 && chmod 777 -R v2-parallel-P30-C0_rtt v2-parallel-P30-C1_rtt' > 30-run.logs

# echo analyzing the qlog files
# python3 ./0-rtt-exp.py v2-parallel-P30-C

# echo "zipping the qlog files"
# zip -r v2-parallel-P30-C0_rtt.zip v2-parallel-P30-C0_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P30-C0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# echo "zipping the qlog files"
# zip -r v2-parallel-P30-C1_rtt.zip v2-parallel-P30-C1_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P30-C1_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen
# zip -r 30-run.logs.zip 30-run.logs
# mv 30-run.logs.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# rm 30-run.logs
# rm -rf v2-parallel-P30-C0_rtt
# rm -rf v2-parallel-P30-C1_rtt

# echo "================done================"
# echo "running the experiment with 60 v2-parallel processes"
# docker exec -t -w /usr/src/proxygen my-running-client bash -c 'python3 run-0-rtt-exp.py 0_rtt 60 && chmod 777 -R v2-parallel-P60-C0_rtt v2-parallel-P60-C1_rtt' > 60-run.logs

# echo analyzing the qlog files
# python3 ./0-rtt-exp.py v2-parallel-P60-C

# echo "zipping the qlog files"
# zip -r v2-parallel-P60-C0_rtt.zip v2-parallel-P60-C0_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P60-C0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# echo "zipping the qlog files"
# zip -r v2-parallel-P60-C1_rtt.zip v2-parallel-P60-C1_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P60-C1_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen
# zip -r 60-run.logs.zip 60-run.logs
# mv 60-run.logs.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# rm 60-run.logs
# rm -rf v2-parallel-P60-C0_rtt
# rm -rf v2-parallel-P60-C1_rtt

# echo "================done================"
# echo "running the experiment with 100 v2-parallel processes"
# docker exec -t -w /usr/src/proxygen my-running-client bash -c 'python3 run-0-rtt-exp.py 0_rtt 100 && chmod 777 -R v2-parallel-P100-C0_rtt v2-parallel-P100-C1_rtt' > 100-run.logs

# echo analyzing the qlog files
# python3 ./0-rtt-exp.py v2-parallel-P100-C

# echo "zipping the qlog files"
# zip -r v2-parallel-P100-C0_rtt.zip v2-parallel-P100-C0_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P100-C0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# echo "zipping the qlog files"
# zip -r v2-parallel-P100-C1_rtt.zip v2-parallel-P100-C1_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P100-C1_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen
# zip -r 100-run.logs.zip 100-run.logs
# mv 100-run.logs.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# rm 100-run.logs
# rm -rf v2-parallel-P100-C0_rtt
# rm -rf v2-parallel-P100-C1_rtt

# echo "================done================"
# echo "running the experiment with 200 v2-parallel processes"
# docker exec -t -w /usr/src/proxygen my-running-client bash -c 'python3 run-0-rtt-exp.py 0_rtt 200 && chmod 777 -R v2-parallel-P200-C0_rtt v2-parallel-P200-C1_rtt' > 200-run.logs

# echo analyzing the qlog files
# python3 ./0-rtt-exp.py v2-parallel-P200-C

# echo "zipping the qlog files"
# zip -r v2-parallel-P200-C0_rtt.zip v2-parallel-P200-C0_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P200-C0_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# echo "zipping the qlog files"
# zip -r v2-parallel-P200-C1_rtt.zip v2-parallel-P200-C1_rtt | tail -n 5

# echo "moving the zip file to home_nfs"
# mv v2-parallel-P200-C1_rtt.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen
# zip -r 200-run.logs.zip 200-run.logs
# mv 200-run.logs.zip /home_nfs/shahlarobert/quic-lb-scheme/quic-lb-proxygen

# rm 200-run.logs
# rm -rf v2-parallel-P200-C0_rtt
# rm -rf v2-parallel-P200-C1_rtt

# echo "================done================"