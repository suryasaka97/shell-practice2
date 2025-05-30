#!/bin/bash


############# General syntax for function  ####################

# Assign colors to the script #
Red="\e[31m"
Green="\e[32m"
Yellow="\e[33m"
Reset="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
LOG_FILE=$(echo "$0" | cut -d "." -f1)
file_name=$LOG_FILE.log

mkdir -p $LOGS_FOLDER
echo "running this script at : $(date)" &>> $LOGS_FOLDER/$file_name


user=$(id -u)

if [ $user -ne 0 ]
then
    echo -e "$Red please run this script with root privileges$Reset" &>> $file_name
    exit 1
else
    echo -e "$Green"Great!...you ae running as sudo this $0 script as root user"$Reset"
fi

# Function for Validating sytem software installation #

validate() {
    if [ $1 -ne 0 ]
    then
        echo -e "$Red Installation of $2 failed please check$Reset"
        exit 1
    else
        echo -e "$Green installed $2 successfully$Reset"
    fi  
}



# Installing mysql script #

echo -e "$Yellow Checking....whether you have mysql installed or not!$Reset"
dnf list installed mysql

if [ $? -ne 0 ]
then
    echo -e "$Red mysql is not installed...installing...$Reset"
    dnf install mysql -y
    validate $? mysql
else
    echo -e "$Yellow mysql is already installed$Reset"
fi    

# Installing python3 #

echo -e  "$Yellow Checking....whether you have python installed or not!$Reset"
dnf list installed python3

if [ $? -ne 0 ]
then
    echo -e "$Red python3 is not installed..installing$Reset"
    dnf install python3 -y
    validate $? python3
else
    echo -e "$Yellow python3 is already installed$Reset"
fi


# Installing Nginx #

echo -e "$Yellow Checking....whether you have nginx installed or not!$Reset"
dnf list installed nginx

if [ $? -ne 0 ]
then
    echo -e "$Red nginx is not installed..installing$Reset"
    dnf install nginx -y
    validate $? nginx
else
    echo -e "$Yellow nginx is already installed$Reset"
fi






