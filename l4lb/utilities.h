//
// Created by shahlarobert on 31/05/2023.
//

#ifndef L4LB_UTILITIES_H
#define L4LB_UTILITIES_H

unsigned short calculateChecksum(unsigned short *buf, int nwords);
unsigned short csum(unsigned short *ptr,int nbytes);
void printPacketHeader(char* packet);



#endif //L4LB_UTILITIES_H
