# https://docs.docker.com/compose/compose-file
version: "3.6"

# https://docs.docker.com/compose/compose-file/#service-configuration-reference
services:

  #custom name
  apache-php:

      # https://docs.docker.com/compose/compose-file/#image
      # https://github.com/udovicic/echo => https://hub.docker.com/r/udovicic/echo/
      image: udovicic/echo:apache-php7.1

      # https://docs.docker.com/compose/compose-file/#ports
      ports:
          - "APACHE_PORT:82" # TODO change port

      # https://docs.docker.com/compose/compose-file/#expose
      expose:
          - "9000"
          - "APACHE_PORT" # TODO change port

      # https://docs.docker.com/compose/compose-file/#volumes
      volumes:
          - ./docker/services/apache-php/volumes/xdebug.ini:/etc/php/7.1/mods-available/xdebug.ini
          - "nfsmount:/var/www/html"
          # TODO uncomment for magento 1
          #MAGENTO_1- ./docker/services/apache-php/volumes/apache-m1.conf:/etc/apache2/sites-available/000-default.conf
          #MAGENTO_1- ./docker/private/local.xml:/var/www/html/app/etc/local.xml
          #MAGENTO_1- ./docker/private/.htaccess:/var/www/html/.htaccess
          # TODO uncomment for magento 2
          #MAGENTO_2- ./docker/services/apache-php/volumes/apache-m2.conf:/etc/apache2/sites-available/000-default.conf
          #MAGENTO_2- ./docker/private/env.php:/var/www/html/app/etc/env.php

      # https://docs.docker.com/compose/compose-file/#environment
      environment:
          - TERM=xterm-256color
          - APACHE_RUN_USER=1000

      # https://docs.docker.com/compose/compose-file/#network-configuration-reference
      networks:
          default:
              aliases:
                  - ${SERVER_NAME}
                  - ${SERVER_ALIAS}

  db:

      # https://hub.docker.com/_/mysql/
      image: mysql:5.7

      ports:
          - "MYSQL_PORT:3306" # TODO change port

      volumes:
          - ./docker/services/db/volumes/database:/tmp/
          #- ./docker/services/db/volumes/data:/var/lib/mysql

      # https://docs.docker.com/compose/compose-file/#healthcheck
      healthcheck:
          test: "/usr/bin/mysql --user=${MYSQL_USER} --password=${MYSQL_USER} --execute \"SHOW DATABASES;\""
          interval: 3s
          timeout: 1s
          retries: 5

      environment:
          MYSQL_DATABASE: magento
          MYSQL_ROOT_PASSWORD: addeos
          MYSQL_USER: addeos
          MYSQL_PASSWORD: addeos

  redis:

      # https://hub.docker.com/_/redis/
      image: redis:latest

#  phpmyadmin:
#
#      # https://hub.docker.com/r/phpmyadmin/phpmyadmin/
#      image: phpmyadmin/phpmyadmin
#
#      ports:
#          - "8080:80"
#
#      environment:
#          MYSQL_USERNAME: ${MYSQL_ROOT_USERNAME}
#          MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
#
#  varnish:
#
#      # https://hub.docker.com/r/eeacms/varnish/
#      image: eeacms/varnish
#
#      ports:
#          - "80:6081"
#          - "6085:6085"
#
#      depends_on:
#          - apache-php
#      volumes:
#          - ./docker/services/varnish/volumes/varnish/varnish.vcl:/etc/varnish/conf.d/varnish.vcl
#      environment:
#          BACKENDS: "apache-php"
#          BACKENDS_PORT: "8282"
#          DNS_ENABLED: "true"
#          BACKENDS_PROBE_INTERVAL: "3s"
#          BACKENDS_PROBE_TIMEOUT: "1s"
#          BACKENDS_PROBE_WINDOW: "3"
#          BACKENDS_PROBE_THRESHOLD: "2"
#          DASHBOARD_USER: "admin"
#          DASHBOARD_PASSWORD: "admin"
#          DASHBOARD_SERVERS: "varnish"
#          DASHBOARD_DNS_ENABLED: "true"

volumes:
  nfsmount:
    driver: local
    driver_opts:
      type: nfs
      o: addr=host.docker.internal,rw,nolock,hard,nointr,nfsvers=3
      device: ":SOURCE_LOCATION" # TODO change files location
  
