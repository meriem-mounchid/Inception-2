FROM debian:buster

RUN apt-get update
RUN apt install -y vim git nginx

RUN rm -f /etc/nginx/sites-available/default
RUN rm -f /etc/nginx/sites-enabled/default
COPY ./nginx.conf /etc/nginx/sites-enabled/nginx.conf
RUN ln -s /etc/nginx/sites-enabled/nginx.conf /etc/nginx/sites-available/nginx.conf

WORKDIR /var/www/html/

RUN git clone https://github.com/meriem-mounchid/misaki-blog.git website

EXPOSE 1337

CMD echo "My Portfolio is Running.." ; nginx -g 'daemon off;'