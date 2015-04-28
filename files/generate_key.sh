#!/bin/bash
echo "Generating an SSL private key to sign your certificate..."
openssl genrsa -des3 -out myssl.key 2048

echo "Generating a Certificate Signing Request..."
openssl req -new -sha256 -key  myssl.key -out myssl.csr

echo "Removing passphrase from key ..."
cp myssl.key myssl.key.org
openssl rsa -in myssl.key.org -out myssl.key
rm myssl.key.org

echo "Generating certificate..."
openssl x509 -req -days 7200 -in myssl.csr -signkey myssl.key -out myssl.crt -extfile openssl.cnf -extensions v3_ca
rm myssl.csr

# -config ./openssl.cnf
#http://www.flatmtn.com/article/setting-openssl-create-certificates
# Edit /etc/ssl/openssl.cnf 
# add subjectAltName = IP:192.168.2.107 in [v3_ca] section
# generate cert
