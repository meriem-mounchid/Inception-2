FROM debian:buster

RUN apt-get update
RUN apt install -y vim nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/selfsigned-nginx.key -out /etc/ssl/certs/selfsigned-nginx.crt -subj "/C=MA/ST=CASABLANCA-SETTAT/L=Khouribga/O=Misaki Ltd./OU=IT/CN=mmounchi.42.fr"

RUN rm -f /etc/nginx/sites-available/default
RUN rm -f /etc/nginx/sites-enabled/default
COPY ./nginx.conf /etc/nginx/sites-enabled/nginx.conf
RUN ln -s /etc/nginx/sites-enabled/nginx.conf /etc/nginx/sites-available/nginx.conf

EXPOSE 443

CMD echo "Nginx is Running.." ; nginx -g 'daemon off;'