FROM	debian:bookworm

RUN		apt update && apt upgrade
RUN     apt install -y wget php php-fpm mariadb-client

# -P to indicate the directory on which we want to download the file
# in this case, /var/www, since this is the one we indicated as the primary directory to display in the nginx container
RUN     wget https://fr.wordpress.org/wordpress-6.5-fr_FR.tar.gz -P /var/www
RUN     cd /var/www && tar -xzf wordpress-6.5-fr_FR.tar.gz && rm wordpress-6.5-fr_FR.tar.gz

# give root write rights
RUN		chown -R root:root /var/www/wordpress

# wordpress CLI
RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# set needed access rights, and place it in binaries directory
RUN     chmod +x wp-cli.phar
RUN     mv wp-cli.phar /usr/local/bin/wp

# avoid errors when running php
RUN mkdir -p /run/php

COPY    ./conf/www.conf /etc/php/8.2/php/pool.d/www.conf
COPY    ./conf/wordpress_config.sh    /wordpress_config.sh
RUN     chmod +x /wordpress_config.sh 

EXPOSE  9000

ENTRYPOINT ["bash", "/wordpress_config.sh"]