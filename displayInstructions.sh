#!/usr/bin/env bash

echo "=================================================
Congratulations!!!
=================================================
You can now run the following command from here to launch the containers :
    docker-compose up -d

You will have 3 containers available :
- apache
- mysql
- redis

To execute bash commands on one of them :
- get the container id with :
    docker ps
- and run :
    docker exec -it <CONTAINER_ID> bash

You can stop the container using the following command from here :
    docker-compose down

IMPORTANT :
=================================================

You still have to import the SQL database export in file.
For that, you will have to execute bash command in the Mysql container.
Run :
    docker exec -it <CONTAINER_ID> bash (CONTAINER_ID being the Mysql container id)
Then :
    mysql -u root -p addeos < /tmp/<DATABASE_DUMP> (mysql root password is defined in docker-compose.yml)
"
