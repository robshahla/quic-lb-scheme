#!/bin/bash

apt-get install -y conntrack
iptables -A FORWARD -i eth1 -j ACCEPT
iptables -A FORWARD -i eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
# /usr/sbin/sshd -D
#python3 -u /usr/src/loadBalancer.py
/usr/sbin/sshd -D -e -f /etc/ssh/sshd_config_test_clion

#tail -f /dev/null
# todo: check how the iptables should be configured.

#-A INPUT -p udp -m udp --dport 8888 -j ACCEPT
#-A FORWARD -i eth1 -j ACCEPT
#-A FORWARD -i eth0 -j ACCEPT
#-A FORWARD -i eth1 -j ACCEPT
#-A FORWARD -i eth0 -j ACCEPT