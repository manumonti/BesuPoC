#!/bin/bash
if [ "$1" != "localhost" ]; then
    IP=$(curl ifconfig.me -s)
else
    IP="$1"
fi

docker-compose --file nodes-docker-compose.yml up --build -d
IPServer=$IP docker-compose --file netstatsserver-docker-compose.yml up --build -d
sleep 15s
docker-compose --file netstatsclient-docker-compose.yml up --build -d

echo "##################################"
echo "Servers IP Address: $IP"
echo "##################################"