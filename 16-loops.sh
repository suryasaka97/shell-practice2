#!/bin/bash

user=$(id -u)
############# General syntax for function  ####################

# Assign colors to the script #
Red="\e[31m"
Green="\e[32m"
Yellow="\e[33m"
Reset="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
LOG_FILE=$(echo "$0" | cut -d "." -f1)
file_name=$LOG_FILE.log

packages=("mysql" "nginx" "python3" "httpd")






if [ $user -ne 0 ]
then
    echo -e "$Red please run this script with root privileges$Reset"
    exit 1
else
    echo -e "$Green"Great!...you ae running this script named $0 root user"$Reset" | tee -a $LOGS_FOLDER/$file_name
fi

mkdir -p $LOGS_FOLDER
echo "running this script at : $(date)" &>> $LOGS_FOLDER/$file_name

# Function for Validating sytem software installation #

validate() {
    if [ $1 -ne 0 ]
    then
        echo -e "$Red Installation of $2 failed please check$Reset" | tee -a $LOGS_FOLDER/$file_name
        exit 1
    else
        echo -e "$Green installed $2 successfully$Reset"   | tee -a $LOGS_FOLDER/$file_name
    fi  
}

#for package in $@ ......To pass packages as Argumentss
for package in ${packages[@]}
do 
echo -e "$Yellow Checking....whether you have $package installed or not!$Reset" | tee -a $LOGS_FOLDER/$file_name
dnf list installed $package &>> $LOGS_FOLDER/$file_name

if [ $? -ne 0 ]
then
    echo -e "$Red $package is not installed...installing...$Reset"  | tee -a $LOGS_FOLDER/$file_name
    dnf install $package -y  &>> $LOGS_FOLDER/$file_name
    validate $? $package
else
    echo -e "$Yellow $package is already installed$Reset" | tee -a $LOGS_FOLDER/$file_name
fi
done









