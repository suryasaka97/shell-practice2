#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)

while IFS= read eachline
do
    usage=$(echo $eachline | awk '{print $6}')
    echo $usage
done <<< $DISK_USAGE