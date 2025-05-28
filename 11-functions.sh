#!/bin/bash


############# General syntax for function  ####################

# greet() {
#     echo "hi $1"
# }

# ############### Calling the Function  ################
# greet $1


#### wite a shell script to install multiple packages #######

#### Example installing NGINX , MYSQL , Python" ###########


# Check user running script as root acess or using sudo command #

user=$(id -u)

if [ $? -ne 0 ]
then
    echo "please run this script with root privileges"
    exit 1
else
    echo "Great!...you ae running as this $0 script as root user"
fi

# Installing mysql script #

echo "Checking....whether you have mysql installed or not!"
dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed...installing..."
    dnf install mysql
    if [ $? -ne 0 ]
    then
        echo "mysql is not installed properly....check dnf install"
        exit 1
    else
        echo "mysql installed successfully"
    fi
else
    echo "mysql is already installed"
fi    

# Installing python3 #

echo "Checking....whether you have python installed or not!"
dnf list installed python3

if [ $? -ne 0 ]
then
    echo "python3 is not installed..installing"
    dnf install python3
    if [$? -ne 0 ]
    then 
        echo "Installation failed please check"
        exit 1
    else
        echo "Installed python3 successfully"
    fi
else
    echo "python3 is already installed"
fi


# Installing Nginx #

echo "Checking....whether you have nginx installed or not!"
dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx is not installed..installing"
    dnf install nginx
    if [$? -ne 0 ]
    then 
        echo "Installation failed please check"
        exit 1
    else
        echo "Installed nginx successfully"
    fi
else
    echo "nginx is already installed"
fi




