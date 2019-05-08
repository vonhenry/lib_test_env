#!/usr/bin/env bash

. init_system_contracts.sh

create_big_voter(){
    create_one eosvoterbig1
    ${cleos} transfer eosio eosvoterbig1 "200000100.0000 "$sym -p eosio
    ${cleos} system delegatebw eosvoterbig1 eosvoterbig1 "100000000.0000 "$sym  "100000000.0000 "$sym -p eosvoterbig1
}
create_big_voter

. ../chain/bp_keys.sh

create_register_producers(){
    bunch=$1
    for i in a b c d e f g h i j k l m n o p q r s t u v w x y z; do
        sfx=${bunch}${i}
        bpname=producer11${sfx} && create_one ${bpname}
        var=p${sfx}_pri && import_key ${!var}
        var=p${sfx}_pub && ${cleos} system regproducer ${bpname} ${!var} http://${bpname}.io 8
    done
}
create_register_producers 1
create_register_producers 2


update_schedule(){
    p=producer11

    schedule1="${p}1a ${p}1b ${p}1c ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
               ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t ${p}1u"

    schedule2="       ${p}1b ${p}1c ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
               ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t ${p}1u ${p}1v"

    schedule3="              ${p}1c ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
               ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t ${p}1u ${p}1v ${p}1w"

    schedule4="                     ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
               ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t ${p}1u ${p}1v ${p}1w ${p}1x"
}
update_schedule


$cleos system voteproducer prods eosvoterbig1 ${schedule1} -p eosvoterbig1
# $cleos system voteproducer prods eosvoterbig1 ${schedule2} -p eosvoterbig1
# $cleos system voteproducer prods eosvoterbig1 ${schedule3} -p eosvoterbig1

