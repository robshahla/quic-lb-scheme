//
// Created by shahlarobert on 31/05/2023.
//
#include <iostream>
#include <cstring>
#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <bitset>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <sys/utsname.h>
#include <cstdlib>
#include <linux/ip.h>
#include <linux/udp.h>

using std::cout;

#include "utilities.h"
unsigned short csum(unsigned short *ptr,int nbytes) {
    register long sum;
    unsigned short oddbyte;
    register short answer;

    sum=0;
    while(nbytes>1) {
        sum+=*ptr++;
        nbytes-=2;
    }
    if(nbytes==1) {
        oddbyte=0;
        *((u_char*)&oddbyte)=*(u_char*)ptr;
        sum+=oddbyte;
    }

    sum = (sum>>16)+(sum & 0xffff);
    sum = sum + (sum>>16);
    answer=(short)~sum;

    return(answer);
}

unsigned short calculateChecksum(unsigned short *buf, int nwords) {
    unsigned long sum;
    for(sum=0; nwords>0; nwords--)
        sum += *buf++;
    sum = (sum >> 16) + (sum &0xffff);
    sum += (sum >> 16);
    return (unsigned short)(~sum);

//old implementation todo: remove
//    unsigned int sum = 0;
//    unsigned short checksum = 0;
//
//    while (len > 1) {
//        sum += *addr++;
//        len -= 2;
//    }
//
//    if (len == 1) {
//        sum += *(unsigned char*)addr;
//    }
//
//    sum = (sum >> 16) + (sum & 0xFFFF);
//    sum += (sum >> 16);
//    checksum = ~sum;
//
//    return checksum;
}

void printPacketHeader(char* packet) {
    struct sockaddr_in saddr;
    struct sockaddr_in daddr;

    struct iphdr *ip = (struct iphdr*)packet;
    struct udphdr *udp = (struct udphdr*)(packet + sizeof(struct iphdr));

    saddr.sin_addr.s_addr = ip->saddr;
    cout << "###" << "source ip: " << inet_ntoa(saddr.sin_addr) << " source port: " << ntohs(udp->source) << "\n";

    daddr.sin_addr.s_addr = ip->daddr;
    cout << "###" << "dest ip: " << inet_ntoa(daddr.sin_addr) << " dest port: " << ntohs(udp->dest) << "\n";

}
