#!/usr/bin/env bash

mysql_connect="mysql -u V_MYSQL_ROOT_USERNAME -pV_MYSQL_ROOT_PASSWORD V_MYSQL_DATABASE"

zcat /tmp/magento.sql.gz | ${mysql_connect}
