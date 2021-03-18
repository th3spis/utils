#!/bin/bash
#Checks the CPU load and take action if it is greater than a specific value
cores=$(nproc) 
load=$(awk '{print $3}'< /proc/loadavg)
#echo | awk -v c="${cores}" -v l="${load}" '{print "relative load is " l*100/c "%"}'
usage=$(echo | awk -v c="${cores}" -v l="${load}" '{print l*100/c}' | awk -F. '{print $1}')
if [[ ${usage} -ge 80 ]]; then
    echo "greater that 80"
fi
