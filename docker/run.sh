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
export NETWORK="Solar Chain"
export SUBNETWORK="Solar Chain Testnet"
export LOGO=/images/chain-wallet.png
export LOGO_FOOTER=/images/chain-wallet.png
export BLOCKSCOUT_VERSION=v4.1.3-beta.1
export RELEASE_LINK='https://github.com/paradeum-team/blockscout/releases/tag/${BLOCKSCOUT_VERSION}'

export DISABLE_EXCHANGE_RATES=true
export DISABLE_KNOWN_TOKENS=true
export SHOW_ADDRESS_MARKETCAP_PERCENTAGE=false
export SHOW_PRICE_CHART=false

export SHOW_TXS_CHART=true

export ENABLE_TXS_STATS=true
export TXS_HISTORIAN_INIT_LAG=0
export TXS_STATS_DAYS_TO_COMPILE_AT_INIT=10

export HISTORY_FETCH_INTERVAL=30
export DISABLE_BRIDGE_MARKET_CAP_UPDATER=true

export HIDE_BLOCK_MINER=true


export DISABLE_READ_API=true
export DISABLE_WRITE_API=true

export SUPPORTED_CHAINS='[{"title":"POA","url":"https://blockscout.com/poa/core"},{"title":"Sokol","url":"https://blockscout.com/poa/sokol","test_net?":true},{"title":"Gnosis Chain","url":"https://blockscout.com/xdai/mainnet"},{"title":"Ethereum Classic","url":"https://blockscout.com/etc/mainnet","other?":true},{"title":"RSK","url":"https://blockscout.com/rsk/mainnet","other?":true},{"title":"Solar Chain Testnet","url":"https://sctscan.starnet.ltd/","test_net?":true}]'

#export APPS_MENU=true
#export EXTERNAL_APPS='[{"title":"Chain Wallet Test","url":"http://test-chain-wallet.netwarps.com/"},{"title":"Wine Test","url":"https://test-wine.netwarps.com/"}]'

export CACHE_BLOCK_COUNT_PERIOD=7200
export CACHE_TXS_COUNT_PERIOD=7200
export CACHE_ADDRESS_COUNT_PERIOD=7200
export CACHE_ADDRESS_SUM_PERIOD=3600
export CACHE_TOTAL_GAS_USAGE_PERIOD=3600
export CACHE_ADDRESS_TRANSACTIONS_GAS_USAGE_COUNTER_PERIOD=1800
export CACHE_TOKEN_HOLDERS_COUNTER_PERIOD=3600
export CACHE_TOKEN_TRANSFERS_COUNTER_PERIOD=3600
export CACHE_ADDRESS_WITH_BALANCES_UPDATE_INTERVAL=1800
export CACHE_AVERAGE_BLOCK_PERIOD=1800
export CACHE_MARKET_HISTORY_PERIOD=21600
export CACHE_ADDRESS_TRANSACTIONS_PERIOD=1800
export CACHE_ADDRESS_TOKENS_USD_SUM_PERIOD=1800
export CACHE_ADDRESS_TOKEN_TRANSFERS_COUNTER_PERIOD=1800
export CACHE_BRIDGE_MARKET_CAP_UPDATE_INTERVAL=1800
export CACHE_TOKEN_EXCHANGE_RATE_PERIOD=1800
export TOKEN_METADATA_UPDATE_INTERVAL=172800

DOCKER_REPO=quay.io/netwarps
APP_NAME=blockscout:$BLOCKSCOUT_VERSION
docker pull $DOCKER_REPO/$APP_NAME
make start -e DOCKER_REPO=$DOCKER_REPO -e APP_NAME=$APP_NAME
