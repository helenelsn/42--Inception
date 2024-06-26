FROM	debian:bookworm

RUN		apt update && apt upgrade
RUN     apt install -y mariadb-server #mariadb-client ??

COPY    conf/mariadb.cnf	/etc/mysql/mariadb.conf.d/mariadb.cnf
COPY    ./conf/mariadb_config.sh  /mariadb_config.sh 
RUN     chmod +x /mariadb_config.sh

EXPOSE  3306

ENTRYPOINT ["bash", "mariadb_config.sh"]
