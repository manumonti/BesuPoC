FROM hyperledger/besu:1.4.4
LABEL maintainer:Manuel Montenegro
EXPOSE 2003
EXPOSE 3003
COPY NodesCommon/genesis.json /var/lib/besu/genesis.json
COPY NodesCommon/permissions_config.toml /var/lib/besu/data/permissions_config.toml
COPY NodesCommon/static-nodes.json /var/lib/besu/data/static-nodes.json
COPY NodesKeys/consumerNode/key /var/lib/besu/data/key
ENV BESU_DATA_PATH=/var/lib/besu/data
ENV BESU_GENESIS_FILE=/var/lib/besu/genesis.json
ENV BESU_PERMISSIONS_NODES_CONFIG_FILE_ENABLED=true
ENV BESU_PERMISSIONS_ACCOUNTS_CONFIG_FILE_ENABLED=true
ENV BESU_RPC_HTTP_ENABLED=true
ENV BESU_RPC_HTTP_API=ADMIN,ETH,NET,PERM,CLIQUE
ENV BESU_HOST_WHITELIST="*"
ENV BESU_RPC_HTTP_CORS_ORIGINS="*"
ENV BESU_RPC_HTTP_PORT=2003
ENV BESU_P2P_PORT=3003
ENV BESU_MIN_GAS_PRICE=0