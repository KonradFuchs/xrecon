#!/bin/bash

if [ -z "$1" ]
then
        echo "Usage: ./dos.sh <Input>"
        exit 1
fi

printf "----- DOS -----"

printf "\n----- Starting monitor mode -----\n\n"
airmon-ng start wlp2s0mon > useless

while read line
    do
        if [[ $line == *monitor mode already enabled for* ]]
        then
                printf "Monitor mode already active on wlp2s0mon\n"
        fi
        else 
                printf "Starting monitor mode on wlp2s0\n *"
done