#!/bin/bash

user=$(id -u)

# if [ $user -eq 0 ]
# then
# echo "Installing............starts"    ###here for readability you can give space" but no need as per syntax!
# else
# echo "Please run this script using Root Access"
# fi 

############Always use fail early and fail fast############################


if [ $user -ne 0 ]
then   
    echo "please run script using sudo or root"
    exit 1
else
    echo "you are unning as root...Installation starts"
fi        

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "Mysql installation is failed"
    exit 1
else
    echo "MySQL instalation is success"
fi        