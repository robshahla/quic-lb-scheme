SERVERS_NUMBER = 2
SERVERS_PORT = 6666


def generate_server_ip_address(server_index):
    """
    Generate IP address for the backend server.
    :param server_index: the index of the backend server
    :return: the IP address of the server with the given index
    """
    return "172.18.2." + str(server_index + 2)


def generate_server_mac_address(server_index):
    """
    Generate MAC address for the backend server.
    :param server_index: the index of the backend server
    :return: the MAC address of the server with the given index
    """
    # todo: this works only for up to 9 backend servers, if we want to add more,
    #  the mac address should be in hex and not in decimal as it is now
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
