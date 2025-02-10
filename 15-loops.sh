#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

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

echo "Script started executing at : $TIMESTAMP" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
echo "ERROR ::You need to have root privileges to run this script"
exit 1 # other than zero
fi

for package in $@
do
dnf list installed $package &>>$LOG_FILE_NAME
if [ $? -ne 0 ] # not installed
then
dnf install $package -y &>>$LOG_FILE_NAME
VALIDATE $? "Installing $package"
else
echo -e "$package is already.......$Y  installed $N"
fi  

done
