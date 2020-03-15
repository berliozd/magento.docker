#!/usr/bin/env bash

source ./temp/params.sh

# Create Apache server conf
# ==========================

# Server admin email and Server name
if [[ ${magento_version} -eq 1 ]];
then
    apache_conf_tpl=templates/apache-m1.conf.tpl
    apache_conf=projects/${project_name}/services/http/volumes/apache-m1.conf
else
    apache_conf_tpl=templates/apache-m2.conf.tpl
    apache_conf=projects/${project_name}/services/http/volumes/apache-m2.conf
fi

cp ${apache_conf_tpl} ${apache_conf}
sed "s/V_SERVER_ADMIN_EMAIL/${server_admin_email}/g" ${apache_conf} > buffer ; cp buffer ${apache_conf}
sed "s/V_SERVER_NAME/${server_name}/g" ${apache_conf} > buffer ; cp buffer ${apache_conf}
sed "s/V_PROJECT_NAME/${project_name}/g" ${apache_conf} > buffer ; cp buffer ${apache_conf}

rm buffer
