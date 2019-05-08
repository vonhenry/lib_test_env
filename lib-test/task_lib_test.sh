#!/usr/bin/env bash

. env.sh

$cleos push action eosio setupgrade '{"up":{"target_block_num":600}}' -p eosio