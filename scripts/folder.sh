#!/usr/bin/env bash

source ./temp/params.sh


echo "create folder "./projects/${project_name} "..."
rm -rf ./projects/${project_name}
mkdir ./projects/${project_name}
mkdir -p ./projects/${project_name}/services/http/volumes/
mkdir -p ./projects/${project_name}/services/db/volumes/
mkdir -p ./projects/${project_name}/services/varnish/volumes/varnish/

#sed "s/127.0.0.1     ${server_name}//g" /etc/hosts > buffer ; cp buffer /etc/hosts ; rm buffer
#echo "127.0.0.1     ${server_name}" >> /etc/hosts