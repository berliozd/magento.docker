# https://docs.docker.com/compose/compose-file
version: "3.6"

# https://docs.docker.com/compose/compose-file/#service-configuration-reference
services:

  #custom name
  mailcatcher:
      image: tophfr/mailcatcher

      ports:
          - "1080:25"

      expose:
          - "1080"

  http:

      # https://docs.docker.com/compose/compose-file/#image
      image: V_HTTP_IMAGE

      # https://docs.docker.com/compose/compose-file/#ports
      ports:
          - "V_APACHE_PORT:82"

      # https://docs.docker.com/compose/compose-file/#expose
      expose:
          - "9000"
          - "V_APACHE_PORT"

      # https://docs.docker.com/compose/compose-file/#volumes
      volumes:
          - "nfsmount:/var/www/html"
          - /Users/didier/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub
          - /Users/didier/.ssh/id_rsa:/root/.ssh/id_rsa
          - ./services/http/volumes/.composer/auth.json:/root/.composer/auth.json
          - ./services/http/volumes/.composer/cache:/root/.composer/cache
          # TODO uncomment for magento 1
          #MAGENTO_1- ./projects/V_PROJECT_NAME/services/http/volumes/apache-m1.conf:/etc/apache2/sites-available/000-default.conf
          #MAGENTO_1- ./projects/V_PROJECT_NAME/services/http/volumes/apache-m1.conf:/etc/apache2/sites-enabled/000-default.conf
          #MAGENTO_1- ./services/http/volumes/magento/magento1/app/etc/local.xml:/var/www/html/app/etc/local.xml
          #MAGENTO_1- ./services/http/volumes/magento/magento1/index.php:/var/www/html/index.php
          #MAGENTO_1- ./services/http/volumes/magento/magento1/.htaccess:/var/www/html/.htaccess
          #MAGENTO_1- ./services/http/volumes/xdebug.ini:/etc/php/V_PHP_VERSION/mods-available/xdebug.ini
          # TODO uncomment for magento 2
          #MAGENTO_2- ./projects/V_PROJECT_NAME/services/http/volumes/apache-m2.conf:/etc/apache2/sites-available/000-default.conf
          #MAGENTO_2- ./projects/V_PROJECT_NAME/services/http/volumes/apache-m2.conf:/etc/apache2/sites-enabled/000-default.conf
          #MAGENTO_2- ./services/http/volumes/magento/magento2/app/etc/env.php:/var/www/html/app/etc/env.php
          #MAGENTO_2- ./services/http/volumes/n98-magerun2.phar:/usr/local/bin/n98-magerun2.phar
          #MAGENTO_2- ./services/http/volumes/pestle.phar:/usr/local/bin/pestle.phar
          #MAGENTO_2- ./services/http/volumes/xdebug.ini:/etc/php/V_PHP_VERSION/mods-available/xdebug.ini

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
          - "V_MYSQL_PORT:3306"

      volumes:
          - V_DATABASE_DUMP:/tmp/magento.sql.gz
          - ./services/db/importDb.sh:/tmp/importDb.sh
          - ./services/db/switchToLocal.sh:/tmp/switchToLocal.sh
          - ./services/db/switchToLocal.sql:/tmp/switchToLocal.sql
          - ./services/db/volumes/data:/var/lib/mysql

      # https://docs.docker.com/compose/compose-file/#healthcheck
      healthcheck:
          test: "/usr/bin/mysql --user=${MYSQL_USER} --password=${MYSQL_USER} --execute \"SHOW DATABASES;\""
          interval: 3s
          timeout: 1s
          retries: 5

      environment:
          MYSQL_DATABASE: V_MYSQL_DATABASE
          MYSQL_ROOT_PASSWORD: V_MYSQL_ROOT_PASSWORD
          MYSQL_USER: V_MYSQL_USER
          MYSQL_PASSWORD: V_MYSQL_PASSWORD

  redis:

      # https://hub.docker.com/_/redis/
      image: redis:latest

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
#          - http
#      volumes:
#          - ./services/varnish/volumes/varnish/varnish.vcl:/etc/varnish/conf.d/varnish.vcl
#      environment:
#          BACKENDS: "http"
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
      device: ":V_SOURCE_LOCATION" # TODO change files location
  
