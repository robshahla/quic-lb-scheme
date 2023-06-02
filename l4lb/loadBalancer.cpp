#include <iostream>
#include <cstring>
#include <unistd.h>
//#include <quiche.h>
#include <bitset>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <sys/utsname.h>
#include <cstdlib>
#include <linux/ip.h>
#include <linux/udp.h>
//#include <netinet/ip.h>
//#include <netinet/udp.h>
#include "utilities.h"

#define VERSION 2
#define MAX_BUFFER_SIZE 8192  // todo: try to change this
#define BACKEND_SERVER_IP "172.18.0.3"
#define LOAD_BALANCER_IP "172.19.1.2"
#define LOAD_BALANCER_PORT 8888
#define BACKEND_SERVER_PORT 6666
#define NUM_BACKEND_SERVERS 2


void printPacketContents(const char* buffer, ssize_t length);
int binaryToDecimal(int n);
int openSocket(int socketPort, in_addr_t receivedIPAddr);
int loadBalancer();
int NAT();

using std::cout;

struct BackendServer {
    std::string ip;
    int port;
};

BackendServer backendServers[NUM_BACKEND_SERVERS] = {
        {BACKEND_SERVER_IP, 6666},  // Backend server 1
};

// IP header structure
//struct ipheader {
//    unsigned char      iph_ihl:4, iph_ver:4;
//    unsigned char      iph_tos;
//    unsigned short int iph_len;
//    unsigned short int iph_ident;
//    unsigned char      iph_flags;
//    unsigned short int iph_offset;
//    unsigned char      iph_ttl;
//    unsigned char      iph_protocol;
//    unsigned short int iph_chksum;
//    unsigned int       iph_sourceip;
//    unsigned int       iph_destip;
//};

// UDP header structure
//struct udpheader {
//    unsigned short int udph_srcport;
//    unsigned short int udph_destport;
//    unsigned short int udph_len;
//    unsigned short int udph_chksum;
//};

// Function to calculate the checksum




// Function to modify the IP address
void modifyDestIP(char* packet, const char* newDestIP) {
    struct iphdr *ip = (struct iphdr*)packet;
    struct udphdr *udp = (struct udphdr*)(packet + sizeof(struct iphdr));

    cout << "received packet header: ";
    printPacketHeader(packet);

    ip->daddr = inet_addr(newDestIP);
    udp->dest = htons(BACKEND_SERVER_PORT);
    udp->len = htons(sizeof(struct udphdr));

    ip->check = calculateChecksum((unsigned short *)packet,
                     sizeof(struct iphdr) + sizeof(struct udphdr));

    cout << "sent packet header: ";
    printPacketHeader(packet);

//    struct ipheader* ip = (struct ipheader*)packet;
//    ip->iph_destip = inet_addr(newDestIP);
//    ip->iph_sourceip = inet_addr(newSourceIP);
//    ip->iph_chksum = 0;
//    ip->iph_chksum = calculateChecksum((unsigned short*)packet, ip->iph_ihl * 4);
}

void modifySourceIP(char* packet, const char* newSourceIP) {
    struct iphdr *ip = (struct iphdr*)packet;
    struct udphdr *udp = (struct udphdr*)(packet + sizeof(struct iphdr));

    cout << "received packet header: ";
    printPacketHeader(packet);

    ip->saddr = inet_addr(newSourceIP);
    udp->source = htons(BACKEND_SERVER_PORT);
    udp->len = htons(sizeof(struct udphdr));

    ip->check = calculateChecksum((unsigned short *)packet,
                                  sizeof(struct iphdr) + sizeof(struct udphdr));

    cout << "sent packet header: ";
    printPacketHeader(packet);

}

struct sockaddr_in getClientAddr(char* packet) {
    struct sockaddr_in clientAddr;
    struct iphdr *ip = (struct iphdr*)packet;
    struct udphdr *udp = (struct udphdr*)(packet + sizeof(struct iphdr));

    clientAddr.sin_family = AF_INET;
    clientAddr.sin_addr.s_addr = ip->saddr;
    clientAddr.sin_port = udp->source;

    return clientAddr;
}

void helloFromMachine() {
    utsname u;
    if (uname(&u) != 0) {
        perror("uname");
        return;
    }

    cout << "Hello from " << u.nodename << " version " << VERSION << "!\n";
}

int main(int argc, char *argv[]) {
    helloFromMachine();

    if (argc < 2) {
        std::cout << "Not enough arguments, usage: " << argv[0] << " <service>: loadBalancer or NAT" << std::endl;
        return 1;
    }

    if (strcmp(argv[1], "loadBalancer") == 0) {
        loadBalancer();
    } else if (strcmp(argv[1],"NAT") == 0) {
        NAT();
    } else {
        std::cout << "Usage: " << argv[0] << " <service>: loadBalancer or NAT" << std::endl;
        return 1;
    }

}

int NAT() {
    int sockfd;
    char buffer[MAX_BUFFER_SIZE];
    struct sockaddr_in servaddr;

    // Create a raw socket
    sockfd = socket(AF_INET, SOCK_RAW, IPPROTO_UDP);
    if (sockfd < 0) {
        std::cerr << "Error in socket creation";
        return 1;
    }

    // Set socket options to receive IP headers
    int on = 1;
    if (setsockopt(sockfd, IPPROTO_IP, IP_HDRINCL, &on, sizeof(on)) < 0) {
        std::cerr << "Error in setsockopt";
        return 1;
    }

    // Configure the load balancer
    const char* loadBalancerIP = LOAD_BALANCER_IP;
    const int loadBalancerPort = LOAD_BALANCER_PORT;
//    const int backendPort = 6666; // Replace with your backend server port
//    const char* virtualIP = "172.19.1.2";
//    const int virtualPort = 8888;

    // Prepare the backend server addresses
//    struct sockaddr_in backendAddr1;

//    std::memset(&backendAddr1, 0, sizeof(backendAddr1));

//    backendAddr1.sin_family = AF_INET;
//    backendAddr1.sin_port = htons(backendPort);
//    backendAddr1.sin_addr.s_addr = inet_addr(backendIP1);

//    backendAddr2.sin_family = AF_INET;
//    backendAddr2.sin_port = htons(backendPort);
//    backendAddr2.sin_addr.s_addr = inet_addr(backendIP2);

    // Bind the socket to the virtual IP address
//    servaddr.sin_family = AF_INET;
//    servaddr.sin_addr.s_addr = inet_addr(virtualIP);
//    servaddr.sin_port = htons(virtualPort);
//
//    if (bind(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0) {
//        std::cerr << "Error in bind";
//        return 1;
//    }

    std::cout << "NAT started. Listening on all received packets" << std::endl;

    // Start load balancing
    while (true) {
        memset(buffer, 0, sizeof(buffer));

        // Receive packets from backend servers
        struct sockaddr_in serverAddr;
        socklen_t serverLen = sizeof(serverAddr);
        int packetLen = recvfrom(sockfd, buffer, sizeof(buffer), 0, (struct sockaddr*)&serverAddr, &serverLen);
        if (packetLen < 0) {
            std::cerr << "Error in recvfrom";
            continue;
        }

        std::cout << "Received " << packetLen << " bytes from " << inet_ntoa(serverAddr.sin_addr) << ":" << ntohs(serverAddr.sin_port) << std::endl;

        // Modify the packet's destination IP
        modifySourceIP(buffer, loadBalancerIP); // Replace with the desired backend IP

        struct sockaddr_in clientAddr = getClientAddr(buffer);

        // Forward the modified packet to the client
        if (sendto(sockfd, buffer, packetLen, 0, (struct sockaddr*)&clientAddr, sizeof(clientAddr)) < 0) {
            std::cerr << "Error in sendto";
            continue;
        }

        std::cout << "Packet forwarded to " << inet_ntoa(clientAddr.sin_addr) << ":" << clientAddr.sin_port << std::endl;
        printPacketHeader(buffer);

        cout << "----------------------" <<"\n";
    }

    // Close the socket
    close(sockfd);

    return 0;

}

int loadBalancer() {
    int sockfd;
    char buffer[MAX_BUFFER_SIZE];
    struct sockaddr_in servaddr;

    // Create a raw socket
    sockfd = socket(AF_INET, SOCK_RAW, IPPROTO_UDP);
    if (sockfd < 0) {
        std::cerr << "Error in socket creation";
        return 1;
    }

    // Set socket options to receive IP headers
    int on = 1;
    if (setsockopt(sockfd, IPPROTO_IP, IP_HDRINCL, &on, sizeof(on)) < 0) {
        std::cerr << "Error in setsockopt";
        return 1;
    }

    // Configure the load balancer
    const char* backendIP1 = BACKEND_SERVER_IP; // Replace with your backend server IPs
    const int backendPort = 6666; // Replace with your backend server port
    const char* virtualIP = LOAD_BALANCER_IP;
    const int virtualPort = LOAD_BALANCER_PORT;

    // Prepare the backend server addresses
    struct sockaddr_in backendAddr1;

    std::memset(&backendAddr1, 0, sizeof(backendAddr1));

    backendAddr1.sin_family = AF_INET;
    backendAddr1.sin_port = htons(backendPort);
    backendAddr1.sin_addr.s_addr = inet_addr(backendIP1);

//    backendAddr2.sin_family = AF_INET;
//    backendAddr2.sin_port = htons(backendPort);
//    backendAddr2.sin_addr.s_addr = inet_addr(backendIP2);

    // Bind the socket to the virtual IP address
    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = inet_addr(virtualIP);
    servaddr.sin_port = htons(virtualPort);

    if (bind(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0) {
        std::cerr << "Error in bind";
        return 1;
    }

    std::cout << "Load balancer started. Listening on " << virtualIP << ":" << virtualPort << std::endl;

    // Start load balancing
    while (true) {
        memset(buffer, 0, sizeof(buffer));

        // Receive packets from clients
        struct sockaddr_in clientAddr;
        socklen_t clientLen = sizeof(clientAddr);
        int packetLen = recvfrom(sockfd, buffer, sizeof(buffer), 0, (struct sockaddr*)&clientAddr, &clientLen);
        if (packetLen < 0) {
            std::cerr << "Error in recvfrom";
            continue;
        }

        std::cout << "Received " << packetLen << " bytes from " << inet_ntoa(clientAddr.sin_addr) << ":" << ntohs(clientAddr.sin_port) << std::endl;


        // Modify the packet's destination IP
//        modifyDestIP(buffer, backendIP1); // Replace with the desired backend IP

        // Forward the modified packet to the backend server
        if (sendto(sockfd, buffer, packetLen, 0, (struct sockaddr*)&backendAddr1, sizeof(backendAddr1)) < 0) {
            std::cerr << "Error in sendto";
            continue;
        }

        std::cout << "Packet forwarded to " << backendIP1 << ":" << backendPort << " From " << inet_ntoa(clientAddr.sin_addr) << std::endl;
        printPacketHeader(buffer);

        cout << "----------------------" <<"\n";
    }

    // Close the socket
    close(sockfd);

    return 0;
}

//int main_old2() {
//
//    int incomeSocket = openSocket(8888, INADDR_ANY);
//    int outcomeSocket = openSocket(9999, INADDR_ANY);
//
//    // Receive and forward packets
//    char incomeBuffer[MAX_BUFFER_SIZE]; //incomeBuffer contains packets received from clients
//    char outcomeBuffer[MAX_BUFFER_SIZE]; //outcomeBuffer contains packets received from backend servers
//
//    while (true) {
//        struct sockaddr_in clientAddr;
//        socklen_t clientAddrLen = sizeof(clientAddr);
//
//        // Receive packet from client
//        ssize_t recvLen = recvfrom(incomeSocket, incomeBuffer, MAX_BUFFER_SIZE, 0, (struct sockaddr *)&clientAddr, &clientAddrLen);
//        if (recvLen < 0) {
//            std::cerr << "Error receiving packet" << std::endl;
//            continue;
//        }
//
//        std::cout << "Received " << recvLen << " bytes from " << inet_ntoa(clientAddr.sin_addr) << ":" << ntohs(clientAddr.sin_port) << std::endl;
//
//
//        // Choose backend server for load balancing
//        BackendServer backendServer = backendServers[0];
//
//        // Forward packet to backend server
//        backendServerAddr.sin_family = AF_INET;
//        backendServerAddr.sin_addr.s_addr = inet_addr(backendServer.ip.c_str());
//        backendServerAddr.sin_port = htons(backendServer.port);
//
//        ssize_t sentLen = sendto(loadBalancerSocket, buffer, recvLen, 0, (struct sockaddr *)&backendServerAddr, sizeof(backendServerAddr));
//        if (sentLen < 0) {
//            std::cerr << "Error forwarding packet to backend server" << std::endl;
//            continue;
//        }
//
//        // Receive response from backend server
////        ssize_t recvLen = recvfrom(loadBalancerSocket, buffer, MAX_BUFFER_SIZE, 0, (struct sockaddr *)&clientAddr, &clientAddrLen);
//
//        ssize_t backendRecvLen = recvfrom(loadBalancerSocket, buffer, MAX_BUFFER_SIZE, 0, nullptr, nullptr);
//        if (backendRecvLen < 0) {
//            std::cerr << "Error receiving response from backend server" << std::endl;
//            continue;
//        }
//
//        std::cout << "Received " << backendRecvLen << " bytes from " << inet_ntoa(clientAddr.sin_addr) << ":" << ntohs(clientAddr.sin_port) << std::endl;
//
//
//        // Send response back to the client
//        ssize_t sentBackLen = sendto(loadBalancerSocket, buffer, backendRecvLen, 0, (struct sockaddr *)&clientAddr, clientAddrLen);
//        if (sentBackLen < 0) {
//            std::cerr << "Error sending response back to client" << std::endl;
//            continue;
//        }
//    }
//
//    close(loadBalancerSocket);
//    return 0;
//}

int main_old(int argc, char *argv[]) {
    helloFromMachine();

    if (argc < 2) {
        std::cout << "Usage: " << argv[0] << " <port>" << std::endl;
        return 1;
    }

    int port = atoi(argv[1]);

    // Create a socket for the load balancer to receive packets from clients
    int lb_socket = socket(AF_INET, SOCK_DGRAM, 0);
    if (lb_socket == -1) {
        perror("socket");
        return 1;
    }

    // Bind the socket to a specific port
    sockaddr_in lb_addr;
    lb_addr.sin_family = AF_INET;
    lb_addr.sin_port = htons(port);
    lb_addr.sin_addr.s_addr = INADDR_ANY;
    memset(&(lb_addr.sin_zero), '\0', 8);

    if (bind(lb_socket, reinterpret_cast<sockaddr*>(&lb_addr), sizeof(sockaddr)) == -1) {
        perror("bind");
        return 1;
    }

    std::cout << "UDP Load balancer is running on port " << port << std::endl;

    // Create a socket to send packets to the backend server
    int backend_socket = socket(AF_INET, SOCK_DGRAM, 0);
    if (backend_socket == -1) {
        perror("socket");
        return 1;
    }

    // Set up the backend server address
    sockaddr_in backend_addr;
    backend_addr.sin_family = AF_INET;
    backend_addr.sin_port = htons(BACKEND_SERVER_PORT);
    if (inet_pton(AF_INET, BACKEND_SERVER_IP, &(backend_addr.sin_addr)) == -1) {
        perror("inet_pton");
        return 1;
    }

    int counter = 0;

    while (true) {
        // Receive data from a client
        counter++;

        sockaddr_in client_addr;
        socklen_t client_addr_len = sizeof(sockaddr_in);
        char buffer[MAX_BUFFER_SIZE];

        ssize_t num_bytes = recvfrom(lb_socket, buffer, MAX_BUFFER_SIZE, 0, reinterpret_cast<sockaddr*>(&client_addr), &client_addr_len);

        if (num_bytes == -1) {
            perror("recvfrom");
            continue;
        }

        std::cout << "Received " << num_bytes << " bytes from " << inet_ntoa(client_addr.sin_addr) << ":" << ntohs(client_addr.sin_port) << std::endl;
//        printPacketContents(buffer, num_bytes);

        // Handle the client request here (e.g., forward the data to a backend server)

        // Example: Echo back the received data to the client
        ssize_t sent_bytes = sendto(backend_socket, buffer, num_bytes, 0, reinterpret_cast<sockaddr*>(&backend_addr), sizeof(sockaddr_in));
        if (sent_bytes == -1) {
            perror("sendto");
        }
        cout << counter << std::endl;
    }

    // Close the server socket
    close(lb_socket);
    close(backend_socket);

    return 0;
}

/**
 * Opens a socket on the specified port.
 *
 * @param port The port to open the socket on.
 * @return The socket file descriptor.
 */
int openSocket(int socketPort, in_addr_t receivedIPAddr) {
    struct sockaddr_in addr;

    int newSocket = socket(AF_INET, SOCK_DGRAM, 0);
    if (newSocket < 0) {
        std::cerr << "Error creating socket" << std::endl;
        return 1;
    }

    // Bind the new socket to a port
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(receivedIPAddr);
    addr.sin_port = htons(socketPort);
    if (bind(newSocket, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
        std::cerr << "Error binding socket" << std::endl;
        return 1;
    }

    return newSocket;
}

void printPacketContents(const char* buffer, ssize_t length) {
//
//    // Parse the QUIC packet using quiche
//    quiche_conn* conn = quiche_accept(NULL, 0, NULL, 0, config);
//    if (conn == NULL) {
//        std::cerr << "Failed to parse QUIC packet" << std::endl;
//        continue;
//    }
//
//    // Process the QUIC packet
//    quiche_conn_recv(conn, reinterpret_cast<const uint8_t*>(buffer), num_bytes);
//
//    // Access QUIC packet details (e.g., version, type, etc.)
//    uint32_t version = quiche_conn_version(conn);
//    std::cout << "QUIC Version: " << version << std::endl;
//
//    // Print the received packet contents
//    std::cout << "Received packet (" << num_bytes << " bytes): ";
//    printPacketContents(buffer, num_bytes);
//
//    // Free the QUIC connection
//    quiche_conn_free(conn);
//
//
//    for (int i = 0; i < length; ++i) {
////        printf("%02X ", static_cast<unsigned char>(buffer[i]));
//        std::bitset<8> bits(buffer[i]);
//        std::cout << binaryToDecimal(bits.to_ulong()) << " ";
////        cout << std::dec << buffer[i] << " ";
//    }
//    printf("\n");
}

int binaryToDecimal(int n) {
    int num = n;
    int dec_value = 0;

    // Initializing base value to 1, i.e 2^0
    int base = 1;

    int temp = num;
    while (temp) {
        int last_digit = temp % 10;
        temp = temp / 10;

        dec_value += last_digit * base;

        base = base * 2;
    }

    return dec_value;
}