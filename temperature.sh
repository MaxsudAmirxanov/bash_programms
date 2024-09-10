#!/bin/bash


while true; do
    echo "-------------------------------"
    echo "$(date)"
    echo "$(sensors | grep 'Core\|temp1')"
    

    echo "$(sensors | grep 'fan')"
    sleep 20 
done
    