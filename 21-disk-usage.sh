#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)

while IFS= read eachline
do
    echo $eachline | awk '{print $6}'
done <<< $DISK_USAGE