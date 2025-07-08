#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)

while IFS= read eachfile
do
    awk '{print $6}'
done >>> $DISK_USAGE