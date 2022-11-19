FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget vim php php-mysql -y

RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php
RUN chmod 755 /var/www/html/adminer.php

EXPOSE 8080

CMD echo "Adminer is Running.." ; php -S 0.0.0.0:8080 /var/www/html/adminer.php