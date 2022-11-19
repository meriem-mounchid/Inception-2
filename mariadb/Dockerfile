FROM debian:buster

ARG MYSQL_USER=$MYSQL_USER
ARG MYSQL_PASSWORD=$MYSQL_PASSWORD
ARG MYSQL_DATABASE=$MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

RUN apt-get update
RUN apt-get install -y vim mariadb-server

COPY ./mariadb.sh /

RUN sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i 's/#port                   = 3306/port                    = 3306/' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /mariadb.sh
RUN service mysql start &&  /bin/sh /mariadb.sh
EXPOSE 3306

CMD echo "Mariadb is Running.." ; mysqld_safe