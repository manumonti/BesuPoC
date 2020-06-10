docker-compose --file nodes-docker-compose.yml up --build -d
IPServer=localhost docker-compose --file netstatsserver-docker-compose.yml up --build -d
sleep 15s
docker-compose --file netstatsclient-docker-compose.yml up --build -d
