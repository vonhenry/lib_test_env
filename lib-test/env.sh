#!/usr/bin/env bash

# According to the source code path on your local host, modify the following environment variables.
CONTRACTS_DIR=/Code/github.com/boscore/bos.contracts/build
CONTRACTS_DIR=/Code/github.com/EOSIO/eosio.contracts/build/contracts

WALLET_DIR=~/tmp/eosio/eosio-wallet

cleos='cleos -u http://127.0.0.1:8888'

sym=EOS

