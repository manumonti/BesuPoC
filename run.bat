#!/bin/bash
docker-compose --file nodes-docker-compose.yml up --build -d
docker-compose --file netstatsserver-docker-compose.yml up --build -d
sleep 20s
docker-compose --file netstatsclient-docker-compose.yml up --build -d