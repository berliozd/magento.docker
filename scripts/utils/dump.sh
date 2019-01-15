#!/usr/bin/env bash

# default params values
default_host=localhost
default_user=root
default_password=addeos
default_database=magento
default_excluded_tables="log_visitor_online log_visitor soon_adminlogger_log smtppro_email_log sendfriend_log lengow_log algoliasearch_queue_log"

# Prompt for variables
read -p "Host? [$default_host]" host
host=${host:-$default_host}
read -p "User? [$default_user]" user
user=${user:-$default_user}
read -p "Password? [$default_password]" password
password=${password:-$default_password}
read -p "Database? [$default_database]" database
database=${database:-$default_database}
read -p "Ignored tables? [$default_excluded_tables]" excluded_tables
excluded_tables=(${excluded_tables:-$default_excluded_tables})


# Prepare ignored tables
ignored_tables=''
for table in "${excluded_tables[@]}"
do :
   ignored_tables+=" --ignore-table=${database}.${table}"
done

file_name=${database}-$(date +"%Y%m%d").sql


mysqldump  -h${host} -u${user} -p${password} --single-transaction --no-data ${database} > ${file_name}
mysqldump -h${host} -u${user} -p${password} --single-transaction --no-create-info  ${ignored_tables} ${database} >> ${file_name}
cat ${file_name} | gzip - > ${file_name}.gz
rm ${file_name}
