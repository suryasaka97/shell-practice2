#!/bin/bash

user=($id -u)

if [ $user -et 0 ]
then
echo "Installing............starts"
else
echo "Please run this script using Root Access"
fi 
