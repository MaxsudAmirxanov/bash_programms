#!/bin/bash

while true; do
    echo "-------------------------------"
    echo "$(sensors | grep 'Core\|temp1')"


    echo "$(sensors | grep 'fan')"
    sleep 60 
    