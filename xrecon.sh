#!/bin/bash
res="results.txt"
if [ -z "$1" ]
then
        printf "Usage: ./xrecon.sh <IP>\n"        
        exit 1
fi
printf " ----- DATE -----\n" > res
date >> res

printf " ----- TARGET -----\n" >> res
printf "$1" >> res

printf "\n ----- NMAP -----\n" >> res

echo "Running Nmap..."
nmap $1 | tail -n +5 | head -n -3 >> res

while read line
do
        if [[ $line == *open* ]] && [[ $line == *http* ]]
        then
                echo "Running Gobuster..."
                gobuster dir -u $1 -w /usr/share/wordlists/dirb/common.txt -qz > temp1

        echo "Running WhatWeb..."
        whatweb $1 -v > temp2
        fi
done < res

if [ -e temp1 ]
then
        printf "\n ----- DIRS -----\n\n" >> res
        cat temp1 >> res
        rm temp1
fi

if [ -e temp2 ]
then
    printf "\n ----- WEB -----\n\n" >> res
        cat temp2 >> res
        rm temp2
fi

cat res
./scripts/mv.sh
whoami > urname
printf " ----- END -----\n"
rm urname