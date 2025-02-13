#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/home/ec2-user/app-logs"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%d-%m-%Y-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
then
echo -e "$2...... $R FAILURE $N"
exit 1
else 
echo  -e "$2...... $G SUCCESS  $N"
fi
}

CHECK_ROOT(){
if [ $USERID -ne 0 ]
then
echo "ERROR ::You need to have root privileges to run this script"
exit 1 # other than zero
fi
}

echo "Script started executing at : $TIMESTAMP" &>>$LOG_FILE

FILES_TO_DELETE=(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files to delete are : ${FILES_TO_DELETE[@]}" &>>$LOG_FILE_NAME