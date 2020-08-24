#!/bin/bash
printf "\nHow do you want to name the file? \n"
read -p "" answer
sudo  mv  /home/konrad/xrecon/res  /home/konrad/xrecon/results/$answer.txt

