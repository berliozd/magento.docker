#!/usr/bin/env bash

source ./temp/params.sh

# SH file ===
file=projects/${project_name}/services/db/switchToLocal.sh

cp templates/switchToLocal.sh.tpl ${file}

sed "s/V_MYSQL_ROOT_USERNAME/${mysql_root_username}/g" ${file} > buffer ; cp buffer ${file}
sed "s/V_MYSQL_ROOT_PASSWORD/${mysql_root_password}/g" ${file} > buffer ; cp buffer ${file}
sed "s/V_MYSQL_DATABASE/${mysql_database}/g" ${file} > buffer ; cp buffer ${file}
sed "s/V_SERVER_NAME/${server_name}/g" ${file} > buffer ; cp buffer ${file}
sed "s/V_APACHE_PORT/${apache_port}/g" ${file} > buffer ; cp buffer ${file}
rm buffer

# SQL file ===
file=projects/${project_name}/services/db/switchToLocal.sql
if [ ${magento_version} -eq 1 ]; then
    cp templates/switchToLocal.sql.tpl ${file}
    sed "s/V_SERVER_NAME/${server_name}/g" ${file} > buffer ; cp buffer ${file}
    sed "s/V_APACHE_PORT/${apache_port}/g" ${file} > buffer ; cp buffer ${file}
    rm buffer
else
    cp templates/switchToLocal_m2.sql.tpl ${file}
    sed "s/V_SERVER_NAME/${server_name}/g" ${file} > buffer ; cp buffer ${file}
    sed "s/V_APACHE_PORT/${apache_port}/g" ${file} > buffer ; cp buffer ${file}
    rm buffer
fi
