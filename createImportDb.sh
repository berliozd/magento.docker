#!/usr/bin/env bash

source ./params.sh

file=docker/services/db/importDb.sh

cp importDb.sh.tpl ${file}

sed "s/V_MYSQL_ROOT_USERNAME/${mysql_root_username}/g" ${file} > buffer ; cp buffer ${file}
sed "s/V_MYSQL_ROOT_PASSWORD/${mysql_root_password}/g" ${file} > buffer ; cp buffer ${file}
sed "s/V_MYSQL_DATABASE/${mysql_database}/g" ${file} > buffer ; cp buffer ${file}
sed "s/V_SERVER_NAME/${server_name}/g" ${file} > buffer ; cp buffer ${file}
sed "s/V_APACHE_PORT/${apache_port}/g" ${file} > buffer ; cp buffer ${file}

rm buffer