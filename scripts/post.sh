#!/usr/bin/env bash

echo "=================================================
Congratulations!!!
=================================================
You can now run the following command from here to launch the containers :
    make up (run docker-compose up -d)

You will have 3 containers available :
- apache
- mysql
- redis

IMPORTANT :
=================================================

You still have to import the SQL database.
You need to execute the following command :
    make db

You can stop the containers using the following command from here :
    make down (docker-compose down)

You can remove all prepared files and build again using :
    make clean

"