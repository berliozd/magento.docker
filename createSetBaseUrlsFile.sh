#!/usr/bin/env bash

source ./params.sh

# Prepare base urls setting command file
echo "update core_config_data set value = 'http://${server_name}' where path like '%secure/base_url%';" > ./docker/services/db/set_base_urls.sql
