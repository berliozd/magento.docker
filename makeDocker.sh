#!/usr/bin/env bash

# Display pre advice
# ==========================
echo "You are a bout to create containers for running a magento site.
=================================================
Prerequisites :
- You will be asked :
    - the web server port (apache/nginx)
    - the mysql port
    - the magento version
    - the server admin email
    - the server name
    - the source file location path
- You must have a database export file store in docker/services/db/volumes/database"

default_ready=y
read -p "Are you ready ? [$default_ready]" ready
ready=${ready:-$default_ready}

if [[ ${ready} != ${default_ready} ]]; then
    exit 1
fi

sudo sh ./clean.sh
sh ./prepareVariables.sh
sh ./createDockerCompose.sh
sh ./createApacheConf.sh
sh ./createImportDb.sh
sudo sh ./addHost.sh
sh ./displayInstructions.sh
