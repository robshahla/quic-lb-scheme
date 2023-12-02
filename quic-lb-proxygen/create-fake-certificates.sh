#!/bin/bash
openssl genrsa -des3 -out server.key 2048
openssl rsa -in server.key -out server.key.insecure
mv server.key server.key.secure
mv server.key.insecure server.key
openssl req -new -key server.key -out server.csr
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

openssl genrsa -des3 -out client.key 2048
openssl rsa -in client.key -out client.key.insecure
mv client.key client.key.secure
mv client.key.insecure client.key
openssl req -new -key client.key -out client.csr
openssl x509 -req -days 365 -in client.csr -signkey client.key -out client.crt