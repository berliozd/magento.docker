#!/usr/bin/env bash

mysql_connect="mysql -u V_MYSQL_ROOT_USERNAME -pV_MYSQL_ROOT_PASSWORD V_MYSQL_DATABASE"

${mysql_connect} < /tmp/switchToLocal.sql