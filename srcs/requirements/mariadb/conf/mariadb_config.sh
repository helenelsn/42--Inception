#! /bin/bash

service mysql start



mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON '${SQL_DATABASE}'.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}' && FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe

#echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > db1.sql
#echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
#echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
#echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO 'root'@'localhost' IDENTIFIED BY '$MYSAL_ROOT_PASSWORD' ;" >> db1.sql
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> db1.sql
#echo "FLUSH PRIVILEGES;" >> db1.sql
#mysql < db1.sql
#
#killall mysqld
#
#mysqld