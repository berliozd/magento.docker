#!/usr/bin/env bash

IFS=/ read -a PARTS <<< $(pwd)
for i in $PARTS
do
    folder=$i
done

docker exec -it ${folder}_db_1 bash
