# Bettergy Besu PoC

This PoC generates a Blockchain Network based on **Hyperledger Besu**.

The network is made up of three nodes: 
- Bettergy Node
- Producer1 Node
- Producer2 Node

Four accounts are created in genesis file (Since private keys are visibles on genesis file, don't use this accounts for production).

Bettergy Account | 999c40dE33361F21212F3D39A3c06944339f4310
--- | ---
Producer1 account | A3971a14D4514E0E0Ba4ef1B65A977839F32431A
Producer2 account | d6291a1c2C6B0ec947cE5Cc53407c34238a9BdEa
Consumer account | E0cb661B3f3136b0d345CbB0F54eb0b011057EC2

Metamask 12 recovery words: 

split series excuse lab garment type mobile such wool okay guide hotel

## Installation
Docker & docker-compose required.

## Run

Create the blockchain and start netstat and blockexplorer server. Public IP of nodes and server is shown:
```
./up.sh
```

Create the blockchain network and start netstat and blockexplorer server. Netstat and blockexplorer server is only accessible from localhost:
```
./up.sh localhost
```

Stop the execution of the nodes and servers. These can be resumed in the future using up.sh
```
./stop.sh
```

Stop the execution of the nodes and servers and delete all the data (remove docker containers)
```
./down.sh
```

## Netstats and blockexplorer

- Netstats: [ip]:80
- Blockexplorer: [ip]:8080