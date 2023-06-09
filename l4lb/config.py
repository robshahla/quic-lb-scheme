VERSION = 3
HEX_BASE = 16
BIN_BASE = 2
BYTE_LENGTH = 8
HOST_ID_LENGTH = 2  # in bytes, host-allocated CIDs (the server ID)
SERVERS_NUMBER = 4
CID_LENGTH = 8  # in bytes, server-allocated CIDs
SERVERS_PORT = 6666
SERVERS_BASE_ADDRESS = "172.18"

verbose = True


def log(*args):
    """
    Print the given message if verbose is set to True.
    :param msg: the message to print
    :return: None
    """
    if verbose:
        print(*args)


def get_ip_from_two_nibbles(nibble_1, nibble_2):
    """
    Generate IP address from two nibbles.
    :param nibble_1: the first nibble
    :param nibble_2: the second nibble
    :return: the IP address
    """
    return SERVERS_BASE_ADDRESS + f".{nibble_2}.{nibble_1}"


def generate_server_ip_address(server_index):
    """
    Generate IP address for the backend server.
    :param server_index: the index of the backend server
    :return: the IP address of the server with the given index
    """
    nibble_1 = server_index + 2
    nibble_2 = 2
    if server_index > 252:
        nibble_1 = server_index % 252
        nibble_2 = server_index // 252 + 2
    return get_ip_from_two_nibbles(nibble_1, nibble_2)


def generate_server_mac_address(server_index):
    """
    Generate MAC address for the backend server.
    :param server_index: the index of the backend server
    :return: the MAC address of the server with the given index
    """
    # todo: this works only for up to 7 backend servers, if we want to add more,
    #  the mac address should be in hex and not in decimal as it is now
    assert server_index < 7
    return "02:42:ac:12:02:0" + str(server_index + 2)


def get_load_balancer_mac_address():
    return "02:42:ac:12:01:02"


def get_load_balancer_ip_address():
    return "172.18.1.2"


def get_nat_ip_address():
    return "172.18.1.3"


def get_nat_mac_address():
    return "02:42:ac:12:01:03"


def get_client_address():
    return "172.18.0.2"
