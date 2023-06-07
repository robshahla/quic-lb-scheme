import socket
import xxhash
import pyshark
import pickle
import json
from scapy.all import *
from pyshark.packet.common import Pickleable
from pyshark.packet.packet import Packet
from pyshark.packet.fields import LayerField, LayerFieldsContainer
from scapy.layers.dot11 import RadioTap
from scapy.utils import *
from config import *
import random

VERSION = 3
HEX_BASE = 16
BIN_BASE = 2
BYTE_LENGTH = 8
counter = 0


def get_four_tuple(packet) -> str:
    """
    Get the four tuple of the packet.
    :param packet: the packet
    :return: the four tuple of the packet as a string
    """
    return str(packet[IP].src) + str(packet[IP].dst) + str(packet[UDP].sport) + str(packet[UDP].dport)


class LoadBalancer:
    def __init__(self):
        # todo: add outside variables to here and implement the ecmp table and the other tables
        self.servers = [(f"s{i}", generate_server_ip_address(i), SERVERS_PORT, generate_server_mac_address(i)) for i in range(SERVERS_NUMBER)]
        self.CID_LENGTH = 8  # in bytes, server-allocated CIDs
        self.LOAD_BALANCER_MAC = get_load_balancer_mac_address()

        pass

    def get_cid_from_tcpdump(self, packet):
        """
        Get the destination connection id from the quic packet.
        Use tcpdump to read the raw packet and parse it as a QUIC packet, then retrieve the
        relevant DCID value.
        :param packet:
        :return: the DCID value
        """
        dcid = None
        packet_dump = json.load(tcpdump(packet, prog=conf.prog.tshark, getfd=True, args=["-T", "json", "-O", "quic"]))
        if "quic" in packet_dump[0]["_source"]["layers"]:
            dcid = packet_dump[0]["_source"]["layers"]["quic"]["quic.dcid"]
            print("DCID IS: ", dcid)
        return dcid

    def get_backend_server_ip(self, server_index):
        """
        Get the IP of the backend server with the given index.
        :param server_index: the index of the backend server
        :return: the IP of the backend server
        """
        return self.servers[server_index][1]

    def get_backend_server_port(self, server_index):
        """
        Get the port of the backend server with the given index.
        :param server_index: the index of the backend server
        :return: the port of the backend server
        """
        return self.servers[server_index][2]

    def get_backend_server_mac(self, server_index):
        """
        Get the MAC address of the backend server with the given index.
        :param server_index: the index of the backend server
        :return: the MAC address of the backend server
        """
        return self.servers[server_index][3]

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
            bin_cid = bin_header[1 * BYTE_LENGTH:1 * BYTE_LENGTH + self.CID_LENGTH * BYTE_LENGTH]
        # bin_cid = (int(hex_cid, base)).zfill(len(hex_cid) * 4)
        print("calculated hex cid: ", hex(int(bin_cid, BIN_BASE)))
        return bin_cid

    def get_new_packet(self, packet, backend_server_index: int):
        """
        Build a new packet to send to the backend server.
        The new packet is built by replacing the destination IP and port of the original packet with the
        destination IP and port of the backend server, and keeping the rest of the packet unchanged.
        :param packet: the received packet from the client
        :param backend_server_index: the index of the backend server to send the packet to
        :return: the new constructed packet
        """
        if "IP" in packet:
            ip = IP(src=packet[IP].src, dst=self.get_backend_server_ip(backend_server_index))

        if "UDP" in packet:
            udp = UDP(sport=packet[UDP].sport, dport=self.get_backend_server_port(backend_server_index))

        print(f"four tuple: {packet[IP].src}:{packet[UDP].sport} -> {ip.dst}:{udp.dport}")

        data = packet[Raw].load
        print("Raw data: ", data)
        ether = Ether(src=self.LOAD_BALANCER_MAC, dst=self.get_backend_server_mac(backend_server_index))
        new_packet = ether/ip/udp/data
        return new_packet

    def four_tuple_hash(self, packet):
        """
        Get the 4-tuple hash of the packet.
        :param packet: the received packet from the client
        :return: the 4-tuple hash of the packet
        """
        h = xxhash.xxh32(get_four_tuple(packet))
        return h.intdigest()

    def get_routing_decision(self, packet) -> int:
        """
        Get the routing decision for the packet.
        :param packet: the received packet from the client
        :return: the index of the backend server to send the packet to
        """
        return self.four_tuple_hash(packet) % SERVERS_NUMBER
        # return random.randint(0, 1)  # todo: the random should be generated only for long header packets, use 5-tuple hash instead of random

    def handle_packet(self, packet):
        print("packet received")
        global counter

        quic_packet = packet[UDP].payload
        cid = self.get_dcid(quic_packet)

        print("hex quic headers: ", cid)

        server_index = self.get_routing_decision(packet)
        print("routing decision: ", server_index)
        new_packet = self.get_new_packet(packet, server_index)
        sendp(new_packet, iface="eth0", verbose=0)

        counter += 1
        print("counter value: ", counter)
        print("------------------------")

    def sniff(self):
        print(f"starting load balancer version {VERSION} on: ", socket.gethostname())

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
    lb.sniff()
    # lb.pyshark_sniff()
