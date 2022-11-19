FROM debian:buster

RUN apt update
RUN apt install -y redis-server vim

EXPOSE 6379

CMD echo "Redis is Running.." ; redis-server --protected-mode no