user_ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Log_Folder="/var/log/shellscript-logs"
file=$(echo $0 | cut -d "." -f1)
filepath="$Log_Folder/$file.log"
SOURCE_DIR=/home/ec2-user/app-logs

mkdir -p /var/log/shellscript-logs

rootuser_check () {
    if [ $user_ID -ne 0 ]
then
    echo -e "please run script with $R"root user$N"" | tee -a $filepath
    exit 1
else
    echo -e "Great you are running with $G "root user$N"" | tee -a $filepath
fi
}


validate () {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failed$N"
        exit 1
    else
        echo -e "$2 is $G succeed...proceeding$N"
    fi    
}

rootuser_check

echo "you are running this script at $(date)" | tee -a $filepath



delete_file=$(find $SOURCE_DIR -name "*.log" -mtime +14) &>> $filepath
validate $? "storing find command into delete file"

while IFS= read -r file_name
do 
  echo "deleting file : $file_name"
  rm -r $file_name
done <<< $delete_file

echo -e  "script executed $G"successfully$N""





