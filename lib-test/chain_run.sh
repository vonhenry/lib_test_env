#!/usr/bin/env bash

. init_system_contracts.sh

create_big_voter(){
    create_one eosvoterbig1
    ${cleos} transfer eosio eosvoterbig1 "200000100.0000 "$sym -p eosio
    ${cleos} system delegatebw eosvoterbig1 eosvoterbig1 "100000000.0000 "$sym  "100000000.0000 "$sym -p eosvoterbig1
}
create_big_voter

. ../bp_keys.sh

create_register_producers(){
    bunch=$1
    for i in a b c d e f g h i j k l m n o p q r s t u v w x y z; do
        sfx=${bunch}${i}
        bpname=producer${base}1${sfx} && create_one $1 ${bpname}
        var=p${sfx}_pri && import_key ${!var}
        var=p${sfx}_pub && ${cleos} system regproducer ${bpname} ${!var} http://${bpname}.io
    done
}
create_register_producers 1
create_register_producers 2


#update_schedule(){
#    p=producer11
#    if [ "$1" == "c2" ];then p=producer21 ;fi
#
#    schedule1="${p}1w ${p}1a ${p}1b ${p}1c ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
#               ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t"
#
#    schedule2="${p}1x ${p}1a ${p}1b ${p}1c ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
#               ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t"
#
#    schedule3="${p}1y ${p}1a ${p}1b ${p}1c ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
#               ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t"
#
#    schedule4="${p}1z ${p}1a ${p}1b ${p}1c ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
#               ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t"
#}
#
#
#update_schedule_v2(){
#    p=producer11
#    if [ "$1" == "c2" ];then p=producer21 ;fi
#
#    schedule1="${p}1a ${p}1b ${p}1c ${p}1d ${p}1e ${p}1f "
#
#    schedule2="${p}1g ${p}1b ${p}1c ${p}1d ${p}1e ${p}1f "
#
#    schedule3="${p}1a ${p}1g ${p}1c ${p}1d ${p}1e ${p}1f "
#
#    schedule4="${p}1a ${p}1b ${p}1g ${p}1d ${p}1e ${p}1f "
#}
#
#update_schedule_v2
#$cleos1 system voteproducer prods eosvoterbig1 ${schedule1} -p eosvoterbig1
#
#update_schedule_v2
#$cleos2 system voteproducer prods eosvoterbig1 ${schedule1} -p eosvoterbig1
#
