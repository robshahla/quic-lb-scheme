from scapy.all import *
import socket

LOAD_BALANCER_IP = "172.18.1.2"
LOAD_BALANCER_PORT = 8888


def handle_packet(packet):
    print("packet received")

    if "IP" in packet:
        print("updating IP dest address")
        # packet["IP"].dst = BACKEND_SERVER_IP
        print(packet["IP"].src)
        print(packet["IP"].dst)
        ip = IP(src=LOAD_BALANCER_IP, dst=packet[IP].dst)

    if "UDP" in packet:
        print("updating UDP dest port")
        # packet["UDP"].dport = BACKEND_SERVER_PORT
        print(packet["UDP"].sport)
        print(packet["UDP"].dport)
        udp = UDP(sport=LOAD_BALANCER_PORT, dport=packet[UDP].dport)

    data = packet[Raw].load
    newp = ip / udp / data
    send(newp, iface="eth0")

    # packet["Ether"].dst = "02:42:ac:12:00:03"
    # packet["Ether"].src = "02:42:ac:12:01:02"
    # eth1 is the interface that is connected to the backend server
    # sendp(packet, iface="eth1", verbose=1)


def main():
    print("starting load balancer")

    print("creating socket and binding to port 8888")
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.bind(("172.18.1.3", 8888))
    # s.connect(("172.19.1.2", 8888))
    print("socket created")

    print("listening to socket")
    # s.listen()
    # s.recvfrom(2048)
    print("socket received packet")

    # p = IP(src="172.19.0.2", dst="172.18.0.3")/ICMP()
    # send(p)

    sniff(filter='udp', prn=handle_packet)


if __name__ == '__main__':
    main()
