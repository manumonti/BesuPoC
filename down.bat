#!/bin/bash
docker-compose --file netstatsclient-docker-compose.yml down
docker-compose --file netstatsserver-docker-compose.yml down
docker-compose --file nodes-docker-compose.yml down