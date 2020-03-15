Listen 82
<VirtualHost *:82>

    ServerAdmin V_SERVER_ADMIN_EMAIL
    ServerName V_SERVER_NAME

    DocumentRoot /var/www/html

    <Directory />
        Options FollowSymLinks
        AllowOverride None
    </Directory>
    <Directory /var/www/html/>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>

    <FilesMatch \.php$>
        SetHandler "proxy:unix:/run/php/php-fpm.sock|fcgi://localhost/"
    </FilesMatch>

    ErrorLog /var/log/http/V_PROJECT_NAME_error.log
    CustomLog /var/log/http/V_PROJECT_NAME_access.log combined
</VirtualHost>

