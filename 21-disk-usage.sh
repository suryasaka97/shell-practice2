#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)

while IFS= read eachline
do
    usage=$(echo $eachline | awk '{print $6}' | cut -d "." -f1)
    partition=$(echo $eachline | awk '{print $7}')
    echo $partition:$usage 
done <<< $DISK_USAGE