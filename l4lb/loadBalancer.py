from scapy.all import *
import socket
import pyshark
import pickle
from pyshark.packet.common import Pickleable
from pyshark.packet.packet import Packet
from pyshark.packet.fields import LayerField, LayerFieldsContainer

BACKEND_SERVER_IP = "172.18.2.2"
BACKEND_SERVER_PORT = 6666

counter = 0


def handle_packet(packet):
    print("packet received")
    global counter

    # quic_packet = packet[UDP].payload
    # quic_headers = quic_packet[Raw].load
    quic_headers = packet
    pickled_packet = pickle.loads(pickle.dumps(quic_headers, pickle.HIGHEST_PROTOCOL))
    pyshark_packet = LayerFieldsContainer(pyshark.packet.packet.Packet(pickled_packet))
    print(pyshark_packet)
    # for layer in pyshark_packet:
    #     print(layer.layer_name)
    # print(LayerField(pyshark_packet).quic.frame)
    # print("Packet #{}, {}".format(pickled_packet.highest_layer, pickled_packet._packet_string))

    # parsed_packet = pyshark.packet.packet.from_string(str(pickled_packet))
    # print(parsed_packet)

    print(quic_headers)

    # print(f'Index: {pyshark_packet.number}')
    # print(f'Timestamp: {pyshark_packet.sniff_time}')
    # print(f'Bytes: {pyshark_packet.length}')
    # print(f'Layers: {pyshark_packet.layers}')

    # for layer in packet:
    #     if layer.layer_name == 'quic':

    if "IP" in packet:
        #print("updating IP dest address")
        #packet["IP"].dst = BACKEND_SERVER_IP
        print(packet["IP"].src)
        print(packet["IP"].dst)
        ip = IP(src=packet[IP].src, dst=BACKEND_SERVER_IP)


    if "UDP" in packet:
        #print("updating UDP dest port")
        #packet["UDP"].dport = BACKEND_SERVER_PORT
        print(packet["UDP"].sport)
        print(packet["UDP"].dport)
        udp = UDP(sport=packet[UDP].sport, dport=BACKEND_SERVER_PORT)

    data = packet[Raw].load
    ether = Ether(src="02:42:ac:12:01:02", dst="02:42:ac:12:02:02")
    newp = ether/ip/udp/data
    sendp(newp, iface="eth0", verbose=0)

    counter += 1
    print("counter value: ", counter)
    print("------------------------")
    #packet["Ether"].dst = "02:42:ac:12:00:03"
    #packet["Ether"].src = "02:42:ac:12:01:02"
    # eth1 is the interface that is connected to the backend server
    #sendp(packet, iface="eth1", verbose=1)


def main():
    print("starting load balancer")

    print("creating socket and binding to port 8888")
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.bind(("172.18.1.2", 8888))
    #s.connect(("172.19.1.2", 8888))
    print("socket created")

    print("listening to socket")
    #s.listen()
    #s.recvfrom(2048)
    print("socket received packet")

    #p = IP(src="172.19.0.2", dst="172.18.0.3")/ICMP()
    #send(p)

    sniff(filter='port 8888', prn=handle_packet)
    global counter
    print("counter value: ", counter)
    print("finished sniffing")


if __name__ == '__main__':
    main()
