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
    echo "please run script using sudo or root access"
    exit 1
else
    echo "you are unning as root...Installation starts"
fi        


echo "checking mysql is installed or not"
dnf list installed mysql

if [ $? -eq 0 ]
then
    echo "mysql is already installed"
    exit 0
else
    echo "installation of my sql starts"

    dnf install mysql -y

    if [ $? -ne 0 ]
    then
        echo "Mysql installation is failed"
        exit 1
    else
        echo "MySQL instalation is success"
    fi    
fi        