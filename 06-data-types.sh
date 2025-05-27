#!/bin/bash


#By default everything is treated as string!

a=10
b=20

sum=$(($a+$b))
echo "$sum"

k=18
d=7
y=12
r=45

add=$((100-$k+$d+$y+$r))
echo "$add"

time=$(date)
echo "$time"

current_user=$(whoami)
echo "$current_user"
