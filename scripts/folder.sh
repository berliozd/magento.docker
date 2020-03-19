#!/usr/bin/env bash

source ./temp/params.sh

echo "create folder "./projects/${project_name} "..."
rm -rf ./projects/${project_name}
mkdir ./projects/${project_name}
mkdir -p ./projects/${project_name}/services/http/volumes/.composer/cache
cp ./services/http/volumes/.composer/auth.json ./projects/${project_name}/services/http/volumes/.composer/
mkdir -p ./projects/${project_name}/services/db/volumes/
mkdir -p ./projects/${project_name}/services/varnish/volumes/varnish/
