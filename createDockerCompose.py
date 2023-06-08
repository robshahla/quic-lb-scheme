from l4lb.config import *


def get_server_compose_entry(server_index):
    """
    Get the docker-compose entry for the backend server with the given index.
    :param server_index: the index of the backend server
    :return: the docker-compose entry for the backend server with the given index
    """
    server_compose_entry = f"""  my-proxygen-server-{server_index}:
    hostname: my-proxygen-server
    container_name: my-proxygen-server-{server_index}
    image: my-proxygen
    cap_add:
      - NET_ADMIN
      - NET_RAW
      - sys_ptrace
    networks:
      scheme-network:
        ipv4_address: {generate_server_ip_address(server_index)}
    mac_address: {generate_server_mac_address(server_index)}
    volumes:
      - ./quic-lb-proxygen:/usr/src/proxygen
    links:
      - my-running-nat
    command: >-
      sh -c \"apt-get install -y iproute2 iptables tcpdump conntrack &&
      ip route del 172.18.0.0/16 &&
      ip r a 172.18.0.0/16 via 172.18.1.3 dev eth0 onlink &&
      ip route del default &&
      ip r a default via 172.18.1.3 dev eth0 onlink &&
      ./proxygen/proxygen/_build/proxygen/httpserver/hq --mode=server --host={generate_server_ip_address(server_index)} --port={SERVERS_PORT} --early_data=true\"
    \n"""

    return server_compose_entry


def get_load_balancer_compose_entry():
    """
    Get the docker-compose entry for the load balancer.
    :return: the docker-compose entry for the load balancer
    """
    load_balancer_compose_entry = f"""  my-running-load-balancer:
    hostname: my-running-load-balancer
    container_name: my-running-load-balancer
    image: my-load-balancer
    cap_add:
      - NET_ADMIN
      - NET_RAW
      - sys_ptrace
    ports:
      - "2222:22"
    networks:
      scheme-network:
        ipv4_address: {get_load_balancer_ip_address()}
    mac_address: {get_load_balancer_mac_address()}
    \n"""

    return load_balancer_compose_entry


def get_nat_compose_entry():
    nat_compose_entry = f"""  my-running-nat:
    hostname: my-running-nat
    container_name: my-running-nat
    image: my-load-balancer
    cap_add:
      - NET_ADMIN
      - NET_RAW
      - sys_ptrace
    ports:
      - "2223:22"
    networks:
      scheme-network:
        ipv4_address: {get_nat_ip_address()}
    command: >-
      sh -c \"apt-get install -y conntrack &&
      tail -f /dev/null\"
    \n"""

    return nat_compose_entry


def get_client_compose_entry():
    client_compose_entry = f"""  my-running-client:
    hostname: my-running-client
    container_name: my-running-client
    image: my-proxygen
    cap_add:
      - NET_ADMIN
      - NET_RAW
      - sys_ptrace
    networks:
      scheme-network:
        ipv4_address: {get_client_address()}
    command: >-
      sh -c \"apt-get install -y iproute2 iptables conntrack tcpdump &&
      tail -f /dev/null\"
    \n"""

    return client_compose_entry


def get_network_compose_entry():
    network_compose_entry = f"""  scheme-network:
    name: scheme-network
    driver: bridge
    driver_opts:
      com.docker.network.enable_ipv6: "true"
    ipam:
      config:
        - subnet: 172.18.0.0/16
    \n"""

    return network_compose_entry


if __name__ == '__main__':
    docker_compose_file = "docker-compose.yml"
    print("Generating docker-compose file: " + docker_compose_file)
    with open(docker_compose_file, "w") as f:
        f.write("version: \"3.5\"\n")
        f.write("networks:\n")
        f.write(get_network_compose_entry())
        f.write("services:\n")
        f.write(get_load_balancer_compose_entry())
        f.write(get_nat_compose_entry())
        f.write(get_client_compose_entry())
        for i in range(SERVERS_NUMBER):
            f.write(get_server_compose_entry(i))

    print("Done!")
