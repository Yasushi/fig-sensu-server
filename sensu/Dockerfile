FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y wget

RUN wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | sudo apt-key add -
RUN echo "deb http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list
RUN apt-get update && apt-get install -y sensu && mkdir -p /etc/sensu/ssl && chgrp sensu /etc/sensu/conf.d && chmod 775 /etc/sensu/conf.d
RUN mkdir /config
ADD client_cert.pem /etc/sensu/ssl/cert.pem
ADD client_key.pem /etc/sensu/ssl/key.pem
ADD config.json.template /etc/sensu/conf.d/
COPY start.sh /tmp/start.sh

EXPOSE 4567

VOLUME [ "/var/log/sensu", "/config" ]

CMD /tmp/start.sh
