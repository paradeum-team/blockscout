#!/bin/bash
set -e
docker rm -f blockscout
export ETHEREUM_JSONRPC_VARIANT=geth
export COIN=ETH
export ETHEREUM_JSONRPC_HTTP_URL=http://127.0.0.1:8545
export DATABASE_URL=postgresql://root:123456@127.0.0.1:5432/blockscout

export NETWORK=SolarNetwork
export SUBNETWORK="SolarNetwork 区域"
export LOGO_TEXT="SolarChain-TestNetwork"
export LOGO=/images/chain-wallet.png
export LOGO_FOOTER=/images/chain-wallet.png
export BLOCKSCOUT_VERSION=0.1

DOCKER_IMAGE=quay.io/netwarps/blockscout:pld
docker pull $DOCKER_IMAGE
make start -e DOCKER_IMAGE=$DOCKER_IMAGE
