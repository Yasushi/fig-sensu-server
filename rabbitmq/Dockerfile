FROM dockerfile/rabbitmq:latest

RUN mkdir -p /etc/rabbitmq/ssl
ADD cacert.pem /etc/rabbitmq/ssl/cacert.pem
ADD server_cert.pem /etc/rabbitmq/ssl/cert.pem
ADD server_key.pem /etc/rabbitmq/ssl/key.pem
ADD rabbitmq.config /etc/rabbitmq/rabbitmq.config

EXPOSE 5671

