#!/usr/bin/env bash

source ./params.sh

# Run docker containers
docker-compose up -d

# ================ Load DB if requested
# === Get prefix from folder
IFS=/ read -a PARTS <<< $(pwd)
for i in $PARTS
do
    folder=$i
done

echo "sleep 5"
sleep 5

# Import database dump file
docker exec -it ${folder}_db_1 bash /tmp/importDb.sh
