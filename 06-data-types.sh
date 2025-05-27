#!/bin/bash


#By default everything is treated as string!

a=10
b=20

sum=$(($a+$b))
echo "$sum"

time=$(date)
echo "$time"

current_user=$(whoami)
echo "$current_user"
