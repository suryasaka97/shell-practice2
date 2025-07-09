#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
threshold_value=1
MSG="Please check : <br>"
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read eachline
do
    usage=$(echo $eachline | awk '{print $6}' | cut -d "%" -f1)
    partition=$(echo $eachline | awk '{print $7}')
    if [ $usage -gt $threshold_value ]
    then
        MSG+="High disk usage on $partition: $usage % <br>"
        #echo $MSG
    fi    
    
done <<< $DISK_USAGE


#echo -e $MSG

sh mail.sh "SRE_Team" "HIGH Disk usage" "$IP" "$MSG" "suryapradeepsaka@gmail.com" "Warning High Disk Usage"

