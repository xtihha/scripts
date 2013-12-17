#!/bin/bash
addrs=(
        'mobile-push01'
        'mobile-push02'
        'mobile-push03'
        'mobile-push04'
        'mobile-push05'
        'mobile-push06'
        'mobile-push07'
        'mobile-push08'
        'mobile-push09'
        'mobile-push10'
        'mobile-push11'
        'mobile-push12'
        'mobile-push13'
        'mobile-push14'
        'mobile-push15'
        'mobile-push16'
        'mobile-push17'
        'mobile-push18'
      )

for((i=0; i<${#addrs[@]};i++))
do
    echo ${addrs[$i]}
    ss=$(ssh "${addrs[$i]}" 'whereis ss' | awk '{print $2}')
    ssh "${addrs[$i]}" "$ss -s" |awk '{if(NR==2) print $0}'
done