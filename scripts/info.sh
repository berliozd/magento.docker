#!/usr/bin/env bash

source ./temp/params.sh

echo "Website url : http://${server_name}:${apache_port}/
Mysql port : ${mysql_port}
Mysql Username : ${mysql_root_username}
Mysql password : ${mysql_root_password}

Commands :
make up    : run docker-compose up -d
make db    : import db and set base urls
make down  : run docker-compose down
make clean : remove all files prepared with build
"
