#!/usr/bin/env bash

echo "=================================================
Congratulations!!!
=================================================
You can now run the following command from here to launch the containers :
    make up (it will run docker-compose up -d)

You will have 3 containers available :
- apache
- mysql
- redis

To execute bash commands on one of them :
- get the container id with :
    docker ps
- and run :
    docker exec -it <CONTAINER_ID> bash

You can stop the containers using the following command from here :
    make clean (it will run docker-compose down)

IMPORTANT :
=================================================

You still have to import the SQL database.
For that, you can execute the following command :
    make db
"