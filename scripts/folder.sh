#!/usr/bin/env bash

source ./temp/params.sh

sed "s/127.0.0.1     ${server_name}//g" /etc/hosts > buffer ; cp buffer /etc/hosts ; rm buffer
echo "127.0.0.1     ${server_name}" >> /etc/hosts