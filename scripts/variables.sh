#!/usr/bin/env bash

params_file=temp/params.sh
apache_image_php56=udovicic\\/echo\:apache\-php5\.6
apache_image_php70=udovicic\\/echo\:apache\-php7\.0
#apache_image_php71=udovicic\\/echo\:apache\-php7\.1
mysql_root_username=root
mysql_root_password=addeos
mysql_database=magento
mysql_user=addeos
mysql_password=addeos

# default params values
default_project_name=mcp
default_apache_port=8282
default_mysql_port=3307
default_magento_version=1
default_php_version=7.0
default_project_folder=/Users/didier/www/mcp
default_source_location=src
default_database_dump_folder=sql
default_database_dump_file_name=0423-MCP.sql.gz
default_server_admin_email=admin@mcp.fr
default_server_name=mcp.docker

# Prompt for variables

read -p "Project name? [$default_project_name]" project_name
project_name=${project_name:-$default_project_name}

read -p "Apache port? [$default_apache_port]" apache_port
apache_port=${apache_port:-$default_apache_port}

read -p "Mysql port? [$default_mysql_port] " mysql_port
mysql_port=${mysql_port:-$default_mysql_port}

read -p "Magento version [$default_magento_version]? " magento_version
magento_version=${magento_version:-$default_magento_version}

read -p "PHP version [$default_php_version]? " php_version
php_version=${php_version:-$default_php_version}

read -p "Project folder? [$default_project_folder]" project_folder
project_folder=${project_folder:-$default_project_folder}

read -p "Source folder? [$default_source_location]" source_location
source_location=${source_location:-$default_source_location}

read -p "Database folder? [$default_database_dump_folder]" database_dump_folder
database_dump_folder=${database_dump_folder:-$default_database_dump_folder}

read -p "Database file name? [$default_database_dump_file_name]" database_dump_file_name
database_dump_file_name=${database_dump_file_name:-$default_database_dump_file_name}

read -p "Server admin email? [$default_server_admin_email]" server_admin_email
server_admin_email=${server_admin_email:-$default_server_admin_email}

read -p "Server name? [$default_server_name]" server_name
server_name=${server_name:-$default_server_name}

# Store variables
echo "#!/usr/bin/env bash" > projects/${project_name}/${params_file}
echo "project_name=${project_name}" >> ${project_name}
echo "apache_image_php56=${apache_image_php56}" >> ${params_file}
echo "apache_image_php70=${apache_image_php70}" >> ${params_file}
echo "mysql_root_username=${mysql_root_username}" >> ${params_file}
echo "mysql_root_password=${mysql_root_password}" >> ${params_file}
echo "mysql_database=${mysql_database}" >> ${params_file}
echo "mysql_user=${mysql_user}" >> ${params_file}
echo "mysql_password=${mysql_password}" >> ${params_file}
echo "apache_port=${apache_port}" >> ${params_file}
echo "mysql_port=${mysql_port}" >> ${params_file}
echo "magento_version=${magento_version}" >> ${params_file}
echo "php_version=${php_version}" >> ${params_file}
echo "server_admin_email=${server_admin_email}" >> ${params_file}
echo "server_name=${server_name}" >> ${params_file}
echo "source_location=${project_folder}/${source_location}" >> ${params_file}
echo "database_dump=${project_folder}/${database_dump_folder}/${database_dump_file_name}" >> ${params_file}