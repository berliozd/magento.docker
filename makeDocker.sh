#!/usr/bin/env bash

# Display pre advice
# ==========================
echo "You are a bout to create containers for running a magento site.
=================================================
Prerequisites :
- You will be asked :
    - the apache port
    - the mysql port
    - the magento version
    - the server admin email
    - the server name
    - the source file location path
- You must have a database export file store in docker/services/db/volumes/database"

read -p "Are you ready ?" ready
if [ $ready != "y" ]
then
exit
fi

# CREATE docker-compose.yml
# ==========================

cp docker-compose.yml.tpl  docker-compose.yml

# Apache port
read -p "Apache port? " apache_port
sed "s/APACHE_PORT/$apache_port/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml

# Mysql port
read -p "Mysql port? " mysql_port
sed "s/MYSQL_PORT/$mysql_port/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml

# Magento version
read -p "Magento 1 [1/2]? " magento_version
if [ $magento_version -eq 1 ]
then
    sed "s/#MAGENTO_1//g" docker-compose.yml > buffer ; cp buffer docker-compose.yml
else
    sed "s/#MAGENTO_2//g" docker-compose.yml > buffer ; cp buffer docker-compose.yml
fi

# Source location
read -p "Source location? " source_location
source_location=${source_location//\//\\/}
sed "s/SOURCE_LOCATION/$source_location/g" docker-compose.yml > buffer ; cp buffer docker-compose.yml

rm buffer

# Create Apache server conf
# ==========================

# Server admin email and Server name
if [ $magento_version -eq 1 ]
then
    apache_conf_tpl=docker/services/apache-php/volumes/apache-m1.conf.tpl
    apache_conf=docker/services/apache-php/volumes/apache-m1.conf
else
    apache_conf_tpl=docker/services/apache-php/volumes/apache-m2.conf.tpl
    apache_conf=docker/services/apache-php/volumes/apache-m2.conf
fi

cp $apache_conf_tpl $apache_conf
read -p "Server admin email? " server_admin_email
sed "s/SERVER_ADMIN_EMAIL/$server_admin_email/g" $apache_conf > buffer ; cp buffer $apache_conf
read -p "Server name? " server_name
sed "s/SERVER_NAME/$server_name/g" $apache_conf > buffer ; cp buffer $apache_conf

rm buffer

# Add server name to /etc/hosts
# ==========================
#127.0.0.1     magento.docker mcp.docker
echo "127.0.0.1     $server_name" >> /etc/hosts

# Display next operations to run docker
# ==========================
echo "=================================================
Congratulations!!!
=================================================
You can now run the following command from here to launch the containers :
    docker-compose up -d

You will have 3 containers available :
- apache
- mysql
- redis

To execute bash commands on one of them :
- get the container id with :
    docker ps
- and run :
    docker exec -it <CONTAINER_ID> bash

You can stop the container using the following command from here :
    docker-compose down

IMPORTANT :
=================================================

You still have to import the SQL database export in file.
For that, you will have to execute bash command in the Mysql container.
Run :
    docker exec -it <CONTAINER_ID> bash (CONTAINER_ID being the Mysql container id)
Then :
    mysql -u root -p magento < /tmp/<DATABASE_EXPORT_FILE_NAME> (mysql root password is defined in docker-compose.yml)
"
