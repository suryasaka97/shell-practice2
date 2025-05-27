#!/bin/bash


# -p : prompt
# -s : silent

echo "Enter two characters using space"
read person1 person2

echo " "

echo "$person1:: Hey $person2, How are you?"
echo "$person2:: Hello $person1, I am fine. How are you doing"
echo "$person1: I am fine too. What's up?"
echo "$person2:: Nohting, just going to Mars now, will you come?"
echo "$person1:: Sorry, you carry on! I will come once you come back"

echo " "
echo " "

read -p "enter the guy whom we need to surrender: " god

echo "you the creator name $god"

echo ""
echo ""

echo "enter your crush name, no wories it is hidden"

read -s crush

echo " "

echo "your crush name is "$crush" haha it is visible"

echo ""

echo ""


read -sp "eneter anything you can see in this line itself: " test

echo $test