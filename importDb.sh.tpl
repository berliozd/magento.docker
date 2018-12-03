#!/usr/bin/env bash

mysql_connect="mysql -u V_MYSQL_ROOT_USERNAME -pV_MYSQL_ROOT_PASSWORD V_MYSQL_DATABASE"

# Import DB
zcat /tmp/magento.sql.gz | ${mysql_connect}

# Update base urls
${mysql_connect} -e "update core_config_data set value = 'http://V_SERVER_NAME' where path like '%secure/base_url%';"