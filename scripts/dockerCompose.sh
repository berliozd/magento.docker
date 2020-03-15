#!/usr/bin/env bash

source ./temp/params.sh

source_location=${source_location//\//\\/}
database_dump=${database_dump//\//\\/}
http_image=${http_image//\//\\/}

docker_compose_file=./projects/${project_name}/docker-compose.yml
cp templates/docker-compose-template.yml  ${docker_compose_file}


sed "s/V_PROJECT_NAME/${project_name}/g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}


# Replace generic variables
sed "s/V_MYSQL_ROOT_USERNAME/${mysql_root_username}/g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}
sed "s/V_MYSQL_ROOT_PASSWORD/${mysql_root_password}/g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}
sed "s/V_MYSQL_DATABASE/${mysql_database}/g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}
sed "s/V_MYSQL_USER/${mysql_user}/g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}
sed "s/V_MYSQL_PASSWORD/${mysql_password}/g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}

# Apache port
sed "s/V_APACHE_PORT/$apache_port/g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}

# Mysql port
sed "s/V_MYSQL_PORT/$mysql_port/g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}

# Magento version
if [ ${magento_version} -eq 1 ]; then
    sed "s/#MAGENTO_1//g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}
else
    sed "s/#MAGENTO_2//g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}
fi

# Http image
sed "s/V_HTTP_IMAGE/${http_image}/g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}

# PHP version
sed "s/V_PHP_VERSION/${php_version}/g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}

# Project source location
sed "s/V_SOURCE_LOCATION/${source_location}/g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}
# Database location
sed "s/V_DATABASE_DUMP/${database_dump}/g" ${docker_compose_file} > buffer ; cp buffer ${docker_compose_file}

rm buffer