FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget vim apache2 php libapache2-mod-php php-curl php-cli php-mysql php-gd -y

RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php
RUN chown -R www-data:www-data /var/www/html/adminer.php
RUN chmod 755 /var/www/html/adminer.php

CMD ["/usr/bin/php", "-S", "0.0.0.0:8080", "/var/www/html/adminer.php"]