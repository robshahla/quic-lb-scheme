import socket
import xxhash
import pyshark
import pickle
import json
import random
from cid import *
from scapy.all import *
from pyshark.packet.common import Pickleable
from pyshark.packet.packet import Packet
from pyshark.packet.fields import LayerField, LayerFieldsContainer
from scapy.layers.dot11 import RadioTap
from scapy.utils import *
from config import *

counter = 0


def get_four_tuple(packet) -> str:
    """
    Get the four tuple of the packet.
    :param packet: the packet
    :return: the four tuple of the packet as a string
    """
    return str(packet[IP].src) + str(packet[UDP].sport) + str(packet[IP].dst) + str(packet[UDP].dport)


def get_two_tuple(packet) -> str:
    """
    Get the two tuple of the packet: source IP and destination IP.
    :param packet: the packet
    :return: the two tuple of the packet as a string
    """
    return str(packet[IP].src) + str(packet[IP].dst)


class LoadBalancer:
    def __init__(self, routing_policy: str):
        # todo: add outside variables to here and implement the ecmp table and the other tables
        log("working in verbose mode")
        self.servers = [(f"s{i}", generate_server_ip_address(i), SERVERS_PORT, generate_server_mac_address(i)) for i in range(SERVERS_NUMBER)]
        self.ip_address_to_server_index = {self.servers[i][1]: i for i in range(SERVERS_NUMBER)}
        self.LOAD_BALANCER_MAC = get_load_balancer_mac_address()
        self.routing_decision = {
            "four_tuple_hash": self.get_four_tuple_hash_routing_decision,
            "routable_cid": self.get_cid_routing_decision,
        }

        log("load balancer started, using routing policy: ", routing_policy)
        log("servers info: ")
        for server in self.servers:
            log(server)

        self.get_routing_decision = self.routing_decision[routing_policy]

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
            log("DCID IS: ", dcid)
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

        log(f"four tuple: {packet[IP].src}:{packet[UDP].sport} -> {ip.dst}:{udp.dport}")

        data = packet[Raw].load
        # log("Raw data: ", data)
        ether = Ether(src=self.LOAD_BALANCER_MAC, dst=self.get_backend_server_mac(backend_server_index))
        new_packet = ether/ip/udp/data
        return new_packet

    def get_hash(self, value_to_hash):
        """
        Get the 4-tuple hash of the packet.
        :param packet: the received packet from the client
        :return: the 4-tuple hash of the packet
        """
        h = xxhash.xxh32(value_to_hash)
        return h.intdigest()

    def get_server_id_from_cid(self, cid: CID) -> int:
        """
        Get the server ID from the CID.
        :param cid: the CID of the packet
        :return: the server ID
        """
        return self.ip_address_to_server_index[cid.get_server_ip()]

    def get_four_tuple_hash_routing_decision(self, packet) -> int:
        """
        Get the routing decision for the packet using the four tuple hash-based routing algorithm.
        :param packet: the received packet from the client
        :return: the index of the backend server to send the packet to
        """
        return self.get_hash(get_four_tuple(packet)) % SERVERS_NUMBER

    def get_two_tuple_hash_routing_decision(self, packet) -> int:
        """
        Get the routing decision for the packet using the two tuple hash-based routing algorithm.
        :param packet: the received packet from the client
        :return: the index of the backend server to send the packet to
        """
        return self.get_hash(get_two_tuple(packet)) % SERVERS_NUMBER

    def get_cid_routing_decision(self, packet) -> int:
        """
        Get the routing decision for the packet using the CID-based routing algorithm.
        We use four (todo:change to two-tuple)
        tuple routing for initial packets that don't use a server allocated
        CID. For short packets that use a server allocated CID, we use the CID to decide the
        backend server to send the packet to.
        No special optimization is being done here.
        :param packet: the received packet from the client
        :return: the index of the backend server to send the packet to
        """
        routing_decision = 0

        if is_long_header(packet):
            routing_decision = self.get_two_tuple_hash_routing_decision(packet)
        else:
            packet_cid = CID(packet)
            routing_decision = self.get_server_id_from_cid(packet_cid)

        return routing_decision

    def handle_packet(self, packet):
        log("packet received")
        global counter

        cid = CID(packet)

        log("hex quic headers: ", cid.get_cid())

        server_index = self.get_routing_decision(packet)
        log("routing decision: ", server_index)
        new_packet = self.get_new_packet(packet, server_index)
        sendp(new_packet, iface="eth0", verbose=0)

        counter += 1
        log("counter value: ", counter)
        log("------------------------")

    def sniff(self):
        print(f"starting load balancer version {VERSION} on: ", socket.gethostname())

        print("creating socket and binding to port 8888")
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.bind(("172.18.1.2", 8888))
        log("socket created")

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
    # lb = LoadBalancer("four_tuple_hash")
    lb = LoadBalancer("routable_cid")
    lb.sniff()
    # lb.pyshark_sniff()
