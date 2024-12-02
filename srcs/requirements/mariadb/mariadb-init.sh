#!/bin/bash

chown -R mysql:mysql /var/lib/mysql

service mariadb start
while ! mysqladmin ping -h localhost --silent; do
	sleep 1
done

echo "$DB_NAME $DB_USER, $DB_PASSWORD, $DB_HOST"
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > init.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >> init.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mysql < init.sql

service mariadb stop
while mysqladmin ping -h localhost --silent; do
	sleep 1
done

mariadbd

