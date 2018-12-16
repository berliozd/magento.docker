#!/usr/bin/env bash

source ./temp/params.sh

IFS=/ read -a PARTS <<< $(pwd)
for i in $PARTS
do
    folder=$i
done

# Import database dump file
docker exec -it ${folder}_db_1 bash /tmp/importDb.sh
