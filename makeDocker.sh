#!/usr/bin/env bash

# Display pre advice
# ==========================
echo "You are about to create containers for running a magento site.
=================================================
Prerequisites :
- You will be asked :
    - the web server port (apache/nginx)
    - the mysql port
    - the magento version
    - the server admin email
    - the server name
    - the source code location path
    - the database dump file (a .tar.gz file) location path and file name"

default_ready=y
read -p "Are you ready ? [$default_ready]" ready
ready=${ready:-$default_ready}

if [[ ${ready} != ${default_ready} ]]; then
    exit 1
fi

sudo sh ./scripts/clean.sh
sh ./scripts/prepareVariables.sh
sh ./scripts/createDockerCompose.sh
sh ./scripts/createApacheConf.sh
sh ./scripts/createImportDb.sh
sudo sh ./scripts/addHost.sh
sh ./scripts/displayInstructions.sh
