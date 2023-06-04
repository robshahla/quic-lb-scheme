from scapy.all import *
import socket
import pyshark
import pickle
import json
from pyshark.packet.common import Pickleable
from pyshark.packet.packet import Packet
from pyshark.packet.fields import LayerField, LayerFieldsContainer
from scapy.layers.dot11 import RadioTap
from scapy.utils import *

BACKEND_SERVER_IP = "172.18.2.2"
BACKEND_SERVER_PORT = 6666
BYTE_LENGTH = 8
HEX_BASE = 16
BIN_BASE = 2
CID_LENGTH = 8  # in bytes, server-allocated CIDs
LOAD_BALANCER_MAC = "02:42:ac:12:01:02"
counter = 0


class LoadBalancer:
    def __init__(self):
        # todo: add outside variables to here and implement the ecmp table and the other tables
        pass

    def is_long_header(self, cid: str):
        """
        Check if the packet is a long header packet or not.
        following RFC 9000, long header packets have the first bit of the first byte set to 1.
        :param cid:
        :return: True if the packet is a long header packet, False otherwise.
        """
        return cid[0] == "1"

    def get_dcid(self, quic_packet_udp_payload) -> str:
        """
        Get the destination connection id from the quic packet.
        :param quic_packet_udp_payload:
        :return:
        """
        hex_header = hexdump(quic_packet_udp_payload[Raw].load, dump=True)[4:48]
        hex_header = hex_header.replace(" ", "")
        print("hex header: ", hex_header)
        # bin_cid = bin(int(hex_cid, base))
        bin_header = "{0:b}".format(int(hex_header, HEX_BASE)).zfill(len(hex_header) * 4)
        if self.is_long_header(bin_header):
            print("long header")
            # the DCID is in the 7th byte of the long header, and its length is written in the 6th byte.
            client_allocated_cid_length = int(bin_header[5 * BYTE_LENGTH:6 * BYTE_LENGTH], BIN_BASE)
            bin_cid = bin_header[6 * BYTE_LENGTH:6 * BYTE_LENGTH + client_allocated_cid_length * BYTE_LENGTH]
        else:
            print("short header")
            # the DCID is in the 2nd byte of the short header, and its length is known by the LB,
            # decided by the system designer with consensus with the backend server.
            bin_cid = bin_header[1 * BYTE_LENGTH:1 * BYTE_LENGTH + CID_LENGTH * BYTE_LENGTH]
        # bin_cid = (int(hex_cid, base)).zfill(len(hex_cid) * 4)
        print("calculated hex cid: ", hex(int(bin_cid, BIN_BASE)))
        return bin_cid

    def get_new_packet(self, packet, destination_ip, destination_port):
        """
        Build a new packet to send to the backend server.
        The new packet is built by replacing the destination IP and port of the original packet with the
        destination IP and port of the backend server, and keeping the rest of the packet unchanged.
        :param packet: the received packet from the client
        :param destination_ip: the IP of the backend server
        :param destination_port: the port of the backend server
        :return: the new constructed packet
        """
        if "IP" in packet:
            ip = IP(src=packet[IP].src, dst=destination_ip)

        if "UDP" in packet:
            udp = UDP(sport=packet[UDP].sport, dport=destination_port)

        print(f"four tuple: {packet[IP].src}:{packet[UDP].sport} -> {packet[IP].dst}:{packet[UDP].dport}")

        data = packet[Raw].load
        print("Raw data: ", data)
        ether = Ether(src=LOAD_BALANCER_MAC, dst="02:42:ac:12:02:02")  # todo: change the dst mac address to be read from an ecmp table based on the destination ip or server name
        new_packet = ether/ip/udp/data
        return new_packet

    def handle_packet(self, packet):
        print("packet received")
        global counter
        print(tcpdump(packet))

        packet_dump = json.load(tcpdump(packet, prog=conf.prog.tshark, getfd=True, args=["-T", "json", "-O", "quic"]))
        if "quic" in packet_dump[0]["_source"]["layers"]:
            print("DCID IS: ", packet_dump[0]["_source"]["layers"]["quic"]["quic.dcid"])

        quic_packet = packet[UDP].payload
        cid = self.get_dcid(quic_packet)

        print("hex quic headers: ", cid)

        new_packet = self.get_new_packet(packet, BACKEND_SERVER_IP, BACKEND_SERVER_PORT)
        sendp(new_packet, iface="eth0", verbose=0)

        counter += 1
        print("counter value: ", counter)
        print("------------------------")

    def scapy_sniff(self):
        print("starting load balancer")

        print("creating socket and binding to port 8888")
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.bind(("172.18.1.2", 8888))
        print("socket created")

        print("listening to socket")
        print("socket received packet")

        sniff(filter='port 8888', prn=self.handle_packet)
        global counter
        print("counter value: ", counter)
        print("finished sniffing")

    def pyshark_handle_packet(self, packet):
        print(type(packet))
        for layer in packet:
            print(layer.layer_name)

    def pyshark_sniff(self):
        print("starting load balancer")

        print("creating socket and binding to port 8888")
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.bind(("172.18.1.2", 8888))
        print("socket created")

        print("listening to socket")
        print("socket received packet")
        capture = pyshark.LiveCapture(interface='eth0', bpf_filter='port 8888')
        capture.apply_on_packets(self.pyshark_handle_packet)


if __name__ == '__main__':
    lb = LoadBalancer()
    lb.scapy_sniff()
    # lb.pyshark_sniff()
