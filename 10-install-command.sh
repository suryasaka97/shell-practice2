#!/bin/bash

user=($id -u)

if [ $user -eq 0 ]
then
echo "Installing............starts"
else
echo "Please run this script using Root Access"
fi 
