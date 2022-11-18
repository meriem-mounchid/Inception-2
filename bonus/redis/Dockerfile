FROM debian:buster

RUN apt update
RUN apt install -y redis-server vim

RUN sed -i 's/bind 127.0.0.1/bind 0.0.0.0/' /etc/redis/redis.conf
RUN sed -i 's/protected-mode yes/protected-mode no/' /etc/redis/redis.conf
RUN sed -i 's/daemonize yes/daemonize no/' /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf"]