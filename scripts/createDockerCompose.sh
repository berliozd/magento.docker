#!/usr/bin/env bash

source ./temp/params.sh

project_folder=${project_folder//\//\\/}
source_location=${source_location//\//\\/}
database_dump=${database_dump//\//\\/}
apache_image_m1=${apache_image_m1//\//\\/}
apache_image_m2=${apache_image_m2//\//\\/}

cp tpl/docker-compose.yml.tpl  docker-compose.yml

# Replace generic variables
sed "s/V_MYSQL_ROOT_USERNAME/${mysql_root_username}/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml
sed "s/V_MYSQL_ROOT_PASSWORD/${mysql_root_password}/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml
sed "s/V_MYSQL_DATABASE/${mysql_database}/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml
sed "s/V_MYSQL_USER/${mysql_user}/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml
sed "s/V_MYSQL_PASSWORD/${mysql_password}/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml

# Apache port
sed "s/V_APACHE_PORT/$apache_port/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml

# Mysql port
sed "s/V_MYSQL_PORT/$mysql_port/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml

# Magento version
if [ ${magento_version} -eq 1 ]; then
    sed "s/V_APACHE_IMAGE/${apache_image_m1}/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml
    sed "s/#MAGENTO_1//g" docker-compose.yml > buffer ; cp buffer docker-compose.yml
else
    sed "s/V_APACHE_IMAGE/${apache_image_m2}/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml
    sed "s/#MAGENTO_2//g" docker-compose.yml > buffer ; cp buffer docker-compose.yml
fi

# Project source location
sed "s/V_SOURCE_LOCATION/${source_location}/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml
# Database location
sed "s/V_DATABASE_DUMP/${database_dump}/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml

rm buffer