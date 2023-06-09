from config import *
from scapy.utils import *
from scapy.all import *


def get_quic_packet(packet):
    """
    Get the quic packet from the packet.
    :param packet: the received packet from the client
    :return: the quic packet
    """
    return packet[UDP].payload


def get_quic_header(packet) -> str:
    """
    Get the quic header from the quic packet.
    :param packet: the whole packet that contains all the layers
    :return: a string that represents the quic header in binary format.
    """
    header_length = 48  # todo: this should probably change, though it works for now

    quic_packet_udp_payload = get_quic_packet(packet)
    hex_header = hexdump(quic_packet_udp_payload[Raw].load, dump=True)[4:header_length]
    hex_header = hex_header.replace(" ", "")
    log("hex header: ", hex_header)
    # bin_cid = bin(int(hex_cid, base))
    bin_header = "{0:b}".format(int(hex_header, HEX_BASE)).zfill(len(hex_header) * 4)
    return bin_header


def is_long_header(packet) -> bool:
    """
    Check if the packet is a long header packet or not.
    following RFC 9000, long header packets have the
    first bit of the first byte set to 1.
    :return: True if the packet is a long header packet, False otherwise.
    """
    first_bit = 0
    bin_header = get_quic_header(packet)
    return bin_header[first_bit] == "1"


class CID:
    def __init__(self, packet):
        """
        Get the destination connection id from the quic packet.
        :param packet: the whole packet that contains all the layers
        :return: the CID binary value in a string format
        """
        # this is the binary header
        bin_header = get_quic_header(packet)

        if is_long_header(packet):
            log("long header")
            # the DCID is in the 7th byte of the long header, and its length is written in the 6th byte.
            client_allocated_cid_length = int(bin_header[5 * BYTE_LENGTH:6 * BYTE_LENGTH], BIN_BASE)
            bin_cid = bin_header[6 * BYTE_LENGTH:6 * BYTE_LENGTH + client_allocated_cid_length * BYTE_LENGTH]
        else:
            log("short header")
            # the DCID is in the 2nd byte of the short header, and its length is known by the LB,
            # decided by the system designer with consensus with the backend server.
            bin_cid = bin_header[1 * BYTE_LENGTH:1 * BYTE_LENGTH + CID_LENGTH * BYTE_LENGTH]
        # bin_cid = (int(hex_cid, base)).zfill(len(hex_cid) * 4)
        log("calculated hex cid: ", hex(int(bin_cid, BIN_BASE)))

        self.cid = bin_cid

    def get_cid(self) -> str:
        """
        Get the CID in binary format.
        :return: the CID
        """
        return self.cid

    def get_server_ip(self) -> str:
        """
        Get the server IP address from the CID. The server ID is in
        the first HOST_ID_LENGTH bytes of the CID.
        :return: the server ID
        """
        cid_start = 2
        # based on the CID allocation in the server, the first two bytes encode the first
        # two nibbles of the IP address
        two_nibbles = int(self.cid[cid_start:cid_start + HOST_ID_LENGTH * BYTE_LENGTH], BIN_BASE)
        nibble_1 = two_nibbles % 1000
        nibble_2 = two_nibbles // 1000
        return get_ip_from_two_nibbles(nibble_1, nibble_2)



