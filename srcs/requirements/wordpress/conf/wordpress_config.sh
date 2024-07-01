#! /bin/bash

# comment éviter le sleep 10 (ie attendre que la db soit bien lancée) ? un healthcheck dans le docker-compose ?

if ! -f wp-config.php; then
    wp config create	--allow-root \
		                --dbname=$SQL_DATABASE \
		                --dbuser=$SQL_USER \
		                --dbpass=$SQL_PASSWORD \
		                --dbhost=mariadb:3306 --path='/var/www/wordpress'
fi

if ! wp core is-installed; then
    wp core install --allow-root --title=inception --url=hlesny.42.fr --admin_user=$WP_ADMIN --admin_email=$WP_ADMIN_EMAIL --admin_password=$WP_ADMIN_PASSWORD
    wp user create --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD
fi

/usr/sbin/php-fpm8.2 -F #verifier qu'installe bien par defaut la derniere version php en date (8.2 le 26/06/24)