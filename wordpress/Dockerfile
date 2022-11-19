FROM debian:buster

ARG WORDPRESS_DB_NAME=$WORDPRESS_DB_NAME
ARG WORDPRESS_DB_USER=$WORDPRESS_DB_USER
ARG WORDPRESS_DB_PASSWORD=$WORDPRESS_DB_PASSWORD
ARG WORDPRESS_DB_HOST=$WORDPRESS_DB_HOST
ARG WORDPRESS_ROOT_USER=$WORDPRESS_ROOT_USER
ARG WORDPRESS_ROOT_PASSWORD=$WORDPRESS_ROOT_PASSWORD
ARG WORDPRESS_USER=$WORDPRESS_USER
ARG WORDPRESS_PASSWORD=$WORDPRESS_PASSWORD

RUN apt-get update
RUN apt-get install php-fpm php-mysql curl vim -y

RUN mkdir -p /var/www/html/wordpress
WORKDIR /var/www/html/wordpress

COPY ./script.sh /
RUN chmod 777 /script.sh

RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000
CMD ["/script.sh"]