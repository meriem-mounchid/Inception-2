#!/bin/sh

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE"
mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'"
mysql -u root -e "FLUSH PRIVILEGES"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost'"
mysql -u root -e "UPDATE mysql.user SET host='%' WHERE user='root'"
mysql -u root -e "FLUSH PRIVILEGES"
mysql -u root -e "ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'"
