#!/bin/sh

env | grep -e '_TCP_ADDR=' -e '_TCP_PORT=' \
    | sed -e 's/^\(.*\)=\(.*\)$/ -e "s!\1!\2!g"/' | tr '\n' ' ' \
    | sed -e 's/^/sed/' -e 's!$! /etc/sensu/conf.d/config.json.template!' \
    | sh - > /etc/sensu/conf.d/config.json

/opt/sensu/bin/sensu-server -c /etc/sensu/config.json -d /etc/sensu/conf.d,/config -e /etc/sensu/extensions -l /var/log/sensu/sensu-server.log -b

/opt/sensu/bin/sensu-client -c /etc/sensu/config.json -d /etc/sensu/conf.d,/config -e /etc/sensu/extensions -l /var/log/sensu/sensu-client.log -b

/opt/sensu/bin/sensu-api -c /etc/sensu/config.json -d /etc/sensu/conf.d,/config -e /etc/sensu/extensions -l /var/log/sensu/sensu-api.log
