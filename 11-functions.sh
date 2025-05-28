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

if [ $user -ne 0 ]
then
    echo "please run this script with root privileges"
    exit 1
else
    echo "Great!...you ae running as sudo this $0 script as root user"
fi

# Function for Validating sytem software installation #

validate() {
    if [ $1 -ne 0 ]
    then
        echo "Installation of $2 failed please check"
        exit 1
    else
        echo "installed $2 successfully"
}



# Installing mysql script #

echo "Checking....whether you have mysql installed or not!"
dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed...installing..."
    dnf install mysql -y
    validate $? mysql
else
    echo "mysql is already installed"
fi    

# Installing python3 #

echo "Checking....whether you have python installed or not!"
dnf list installed python3

if [ $? -ne 0 ]
then
    echo "python3 is not installed..installing"
    dnf install python3 -y
    if [$? -ne 0 ]
    validate $? python3
else
    echo "python3 is already installed"
fi


# Installing Nginx #

echo "Checking....whether you have nginx installed or not!"
dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx is not installed..installing"
    dnf install nginx -y
    validate $? nginx
else
    echo "nginx is already installed"
fi






