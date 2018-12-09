#!/usr/bin/env bash

IFS=/ read -a PARTS <<< $(pwd)
for i in $PARTS
do
    folder=$i
done

docker exec -it ${folder}_apache-php_1 bash
