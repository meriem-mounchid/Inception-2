FROM debian:buster

ARG WORDPRESS_DB_NAME=misaki_db
ARG WORDPRESS_DB_USER=misaki_user
ARG WORDPRESS_DB_PASSWORD=misaki
ARG WORDPRESS_DB_HOST=mariadb

ARG WORDPRESS_ROOT_USER=root_misaki
ARG WORDPRESS_ROOT_PASSWORD=root_misaki
ARG WORDPRESS_USER=misaki_user
ARG WORDPRESS_PASSWORD=misaki

RUN apt-get update
RUN apt-get install php-fpm php-mysql curl vim -y

WORKDIR /var/www/html/wordpress

COPY ./script.sh /
RUN chmod 777 /script.sh

RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000
CMD ["/script.sh"]