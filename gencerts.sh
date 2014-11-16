#!/bin/sh

cd `dirname $0`

if [ ! -d ssl_certs ]; then
    wget -c http://sensuapp.org/docs/0.16/tools/ssl_certs.tar
    tar xf ssl_certs.tar
fi

if [ ! -f ssl_certs/client/key.pem ]; then
    cd ssl_certs
    ./ssl_certs.sh generate
    cd ..
fi

cp ssl_certs/sensu_ca/cacert.pem rabbitmq/
cp ssl_certs/server/cert.pem rabbitmq/server_cert.pem
cp ssl_certs/server/key.pem rabbitmq/server_key.pem
cp ssl_certs/client/cert.pem sensu/client_cert.pem
cp ssl_certs/client/key.pem sensu/client_key.pem
