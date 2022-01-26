docker rm -f blockscout
export NETWORK=Solar
export SUBNETWORK="SolarNetwork 区域"
export LOGO_TEXT = "SolarChain-TestNetwork"
export LOGO=/images/chain-wallet.png
export LOGO_FOOTER=/images/chain-wallet.png
export LOGO_FOOTER=/images/ethereum.png
export ETHEREUM_JSONRPC_VARIANT=geth
export COIN=ETH
make start
