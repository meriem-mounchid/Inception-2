#!/bin/sh
END="\033[0m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"


if [ -x "$(command -v docker)" ]; then
    echo "$YELLOW -- Docker Is Already Installed --$END"
else
{
    echo "$GREEN -- Start Installing Docker -- $END"
    sudo usermod -aG sudo misaki
    sudo apt-get update
    sudo apt install docker.io -y
    sudo apt install curl vim -y
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo usermod -aG docker misaki
    echo "$GREEN -- Docker Installed Successfully -- $END"
}
fi

sudo chmod 777 /etc/hosts
IP="$(hostname -I | awk '{print $1}')"
echo "$IP www.mmounchi.42.fr" >> /etc/hosts
echo "$YELLOW -- Your Domain Name is www.mmounchi.42.fr --$END"
mkdir ./data/wordpress_nginx
mkdir ./data/mariadb_data