# Installing a new magento 2 instance from scratch
* create a project folder for sources 

```mkdir ~/www/magento2test/ ```

```#with 1 subfolder```

```mkdir ~/www/magento2test/magento2test)```

* create a project folder for docker 

```mkdir ~/www/dockers/magento2test```

* from docker folder :

```git clone git@git`hub.com:berliozd/magento.docker.git .```
* ```make``` :
    * Project name? magento2test
    * Apache port? 8282
    * Mysql port? 3307
    * Magento version? 2
    * PHP version ? 7.0
    * Project folder? ~/www/magento2test
    * Source folder? magento2test
    * Database folder? sql
    * Database file name?
    * Server admin email? admin@magento2test.fr
    * Server name? magento2test.docker
* in docker-compose.yml, comment following line to keep folder /var/www/html/ empty in container 
    * ./docker/private/magento2/app/etc/env.php:/var/www/html/app/etc/env.php
* ```make up```
* ```make bashWeb``` to open bash session in web container
* in web container : 
    * ```rm /var/www/html/index.html```
* in web container : 
    * ```n98-magerun2 install```
        * choose magento version
        * Enter installation folder: . (let composer download everything)
        * Please enter the database host : db
        * Please enter the database port : 3306
        * Please enter the database username : root
        * Please enter the database password : addeos
        * Please enter the database name : magento 
        * Please enter the base url : http://magento2test.docker:8282/
        * Install sample data? : y

That's it!

# Installing an existing magento 2 instance (with existing db and code)

* git clone of project in local host folder (sync with /var/html in web server container)
* build containers (make)
* connect in web server container (make bashWeb)
* run n98-magerun2 install in a temporary folder (select the wanted version of magento) (sélectionner la version de magento voulue et aller au bout de l’instal avec création d’une db que l’on n’utilisera pas)
* Copie de ces fichiers vers le dossier ou a été cloné le projet  ( cp -rf temp/* html/)
* Création d’une base de donnée
* Import de la base de preprod (ou prod) dans cette base +  switch to local
* Activer les modules : bin/magento mod:ena --all
* Lancer les installer de modules :  bin/magento se:up   
* Déployer les statiques : bin/magento setup:static-content:deploy   