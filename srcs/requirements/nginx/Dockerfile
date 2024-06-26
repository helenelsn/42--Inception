FROM	debian:bookworm

RUN		apt update && apt upgrade
RUN		apt install -y nginx openssl 

# directory to store tsl key and certificate 
RUN		mkdir -p /etc/nginx/ssl
RUN 	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=hlesny.42.fr/UID=hlesny"

# directory to store nginx configuration file
RUN 	mkdir -p /var/run/nginx

COPY	./conf/nginx.conf /etc/nging/nginx.conf

# root principal
RUN 	chmod 755 /var/www/html
# utilisateur principal
RUN 	chown -R www-data:www-data /var/www/html

# start nginx in fg. is omiting the ';' after 'daemon off' fatal ?
CMD ["nginx", "-g", "daemon off"] 