FROM debian:buster

RUN apt-get update
RUN apt-get install -y vim wget

RUN wget https://github.com/google/cadvisor/releases/download/v0.36.0/cadvisor
RUN chmod +x cadvisor

EXPOSE 8081

CMD echo "CAdvisor is Running.." ; ./cadvisor --port=8081