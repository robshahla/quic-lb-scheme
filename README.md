# Load Balancing Proxygen

To run the containers, run the following command:
```bash
docker-compose up -d
```

Make sure that the docker images `my-load-balancer` and `my-proxygen` are built before running the containers.
<!-- TODO: add explanation about the builkd of the docker images. -->

## Deploy
To test the load balancing, first deploy the load balancer:
```bash
docker exec -it my-load-balancer /bin/bash
```

Then inside the container (in the current directory), run the following command:
```bash
python3 loadBalancer.py
```

Then, connect to the client container:
```bash
docker exec -it my-load-balancer-new /bin/bash
```

Then, inside the container, run the following command:
```bash
./proxygen/proxygen/_build/proxygen/httpserver/hq --mode=client --host=172.18.1.2 --port=8888 --path=/10 --qlogger_path=./proxygen/0-rtt-qlogs/ --sequential=true --protocol=h3 --cert=/etc/ssl/certs/server.crt --key=/etc/ssl/private/server.key --early_data=true --psk_file=./psk.txt
```

This command will send a request to the load balancer, which will forward the request to the proxygen server. The proxygen server will then send the response back to the client.
The response to the client will be routed using a NAT so that the client won't have the direct IP address of the proxygen server.
The command uses HTTP/3 to send a request to the server to fetch 10 random bytes (the path is `/10`, 
though its the same bytes for all the requests. This doesn't affect the experiment, since
the experiment is about the encryption costs etc.). The command also uses 0-RTT to send the request, 
using the psk file `psk.txt`, and the certificate and key files `server.crt` and `server.key` respectively. 
The qlog file will be saved in the directory `0-rtt-qlogs`. If you don't want 
to use 0-RTT, you can instead use the following command:
```bash
./proxygen/proxygen/_build/proxygen/httpserver/hq --mode=client --host=172.18.1.2 --port=8888 --path=/10 --qlogger_path=./proxygen/1-rtt-qlogs/ --sequential=true --protocol=h3 --cert=/etc/ssl/certs/server.crt --key=/etc/ssl/private/server.key
```

- `./quic-lb-proxygen/create-fake-certificates.sh` is a script that creates a fake certificate for the proxygen server and the client. The same 
certificate will be used in both for simplicity. The certificate and key files will be saved in the `./quic-lb-proxygen/proxygen` directory,
and will then be copied to the relevant location in each of the container in their deployment. The certificates are not
signed by any CA, they are self-signed certificates.

## 0-RTT VS 1-RTT
To test the difference between 0-RTT and 1-RTT in terms of latency, the experiment will be done by deploying the 
client and server in the same docker container (`my-proxygen-server-0`) so that the network round-trip latency will be
as close to 0 as possible.
The evaluation is of the time it takes for the server to generate a new key and send it to the client, so that the client
can then send its request using 1-RTT packet, vs the time it takes for the client to send its request using 0-RTT packet,
which is encrypted using a key from the previous connection (saved in the `psk.txt` file).

To start the experiment, first deploy the server:
```bash
docker-compose up -d my-proxygen-server-0
```

Then, connect to this server:
```bash
docker exec -it my-proxygen-server-0 /bin/bash
```

Then, inside the container, run the following command:
```bash
./run-0-rtt-exp.sh <config> <num_iterations> <qlog_path>
```
Where `<config>` is either `0_rtt` or `1_rtt`, and `<num_iterations>` is the number of iterations to run in each configuration.
The `<qlog_path>` is the path to the directory where the qlogs will be saved.
The command will run a number of iterations in each configuration (0-RTT and non-0-RTT).

To run the experiment with mutiple processes (in parallel), run the following command inside the container:
```bash
python3 run-0-rtt-exp.py
```
The number of iterations and processes to be run are written inside the file.

Once that's done, you can run the following command to get the average time and other statistics of each configuration:
```bash
python3 0-rtt-exp.py
```

The latency is measured as the time between the send of the first Initial packet from the client, and the receive of the first data packet 
(short header packet) from the server.

We deploy two sets of experiments; one where all the requests are made sequentially, and one where all the requests are made in parallel.

To analyze the results, run the following command:
```bash
python3 0-rtt-exp.py
```
The results will be save to a csv file in a directory specified in the `0-rtt-exp.py` file,
and a plot will be saved in the same directory.

To analyze the results across both 0-RTT and 1-RTT, run the following command:
```bash
python3 0-rtt-exp.py v2-parallel-P1-C
```
Where `v2-parallel-P1-C0_rtt`, `v2-parallel-P1-C1_rtt` are the names of the directory where the results are saved.

