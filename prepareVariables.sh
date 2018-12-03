#!/usr/bin/env bash

params_file=params.sh
#apache_image=udovicic\\/echo\:apache\-php7\.1
#apache_image=1alexcheng\\/magento
apache_image=1and1internet\\/ubuntu\-16\-apache\-php\-7\.2
mysql_root_username=root
mysql_root_password=addeos
mysql_database=magento
mysql_user=addeos
mysql_password=addeos

# Prompt for variables
read -p "Apache port? " apache_port
read -p "Mysql port? " mysql_port
read -p "Magento 1 [1/2]? " magento_version
read -p "Project folder? " project_folder
read -p "Source folder? " source_location
read -p "Database folder? " database_dump_folder
read -p "Database file name? " database_dump_file_name
read -p "Server admin email? " server_admin_email
read -p "Server name? " server_name

# Store variables
echo "#!/usr/bin/env bash" > ${params_file}
echo "apache_image=${apache_image}" >> ${params_file}
echo "mysql_root_username=${mysql_root_username}" >> ${params_file}
echo "mysql_root_password=${mysql_root_password}" >> ${params_file}
echo "mysql_database=${mysql_database}" >> ${params_file}
echo "mysql_user=${mysql_user}" >> ${params_file}
echo "mysql_password=${mysql_password}" >> ${params_file}
echo "apache_port=${apache_port}" >> ${params_file}
echo "mysql_port=${mysql_port}" >> ${params_file}
echo "magento_version=${magento_version}" >> ${params_file}
echo "server_admin_email=${server_admin_email}" >> ${params_file}
echo "server_name=${server_name}" >> ${params_file}
echo "source_location=${project_folder}/${source_location}" >> ${params_file}
echo "database_dump=${project_folder}/${database_dump_folder}/${database_dump_file_name}" >> ${params_file}