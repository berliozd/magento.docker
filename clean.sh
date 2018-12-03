#!/usr/bin/env bash

sudo rm params.sh
sudo rm docker-compose.yml
sudo rm docker/services/db/importdb.sh
sudo rm docker/services/apache-php/volumes/apache-m1.conf
sudo rm docker/services/apache-php/volumes/apache-m2.conf
sudo rm -rf docker/services/db/volumes/data/*