#!/bin/bash
BASE_DIR=$(cd `dirname $0` && pwd)
cd $BASE_DIR

grep 4000  /var/spool/cron/root || echo "*/5 * * * *  /usr/bin/netstat -lntp|grep 4000 || $BASE_DIR/run.sh" >> /var/spool/cron/root

set -e
docker rm -f blockscout
export ETHEREUM_JSONRPC_VARIANT=geth
export COIN=SC
export COIN_NAME=SC
export ETHEREUM_JSONRPC_HTTP_URL=http://172.35.0.239:8545
export ETHEREUM_JSONRPC_WS_URL=ws://172.35.0.239:8546
#export DATABASE_URL=postgresql://root:123456@127.0.0.1:5432/blockscout

export INDEXER_MEMORY_LIMIT=5Gb

export BLOCK_TRANSFORMER="clique"
export NETWORK=SolarChain
export SUBNETWORK="SolarChain"
export LOGO=/images/chain-wallet.png
export LOGO_FOOTER=/images/chain-wallet.png
#export BLOCKSCOUT_VERSION=0.1

export DISABLE_EXCHANGE_RATES=true
export SHOW_PRICE_CHART=false
export SHOW_TXS_CHART=true

export DISABLE_READ_API=true
export DISABLE_WRITE_API=true

#export INDEXER_DISABLE_ADDRESS_COIN_BALANCE_FETCHER=true
#export INDEXER_DISABLE_PENDING_TRANSACTIONS_FETCHER=true
#export INDEXER_DISABLE_INTERNAL_TRANSACTIONS_FETCHER=true
#export INDEXER_DISABLE_BLOCK_REWARD_FETCHER=true
#export INDEXER_DISABLE_CATALOGED_TOKEN_UPDATER_FETCHER=true
#export INDEXER_DISABLE_EMPTY_BLOCK_SANITIZER=true
#export DISABLE_INDEXER=true

DOCKER_REPO=quay.io/netwarps
APP_NAME=blockscout:jyliu
docker pull $DOCKER_REPO/$APP_NAME
make start -e DOCKER_REPO=$DOCKER_REPO -e APP_NAME=$APP_NAME
