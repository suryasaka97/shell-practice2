#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
threshold_value=1

while IFS= read eachline
do
    usage=$(echo $eachline | awk '{print $6}' | cut -d "%" -f1)
    partition=$(echo $eachline | awk '{print $7}')
    if [ $usage -gt $threshold_value ]
    then
        MSG="High disk usage on $partition:$usage"
        echo MSG
    fi    
done <<< $DISK_USAGE