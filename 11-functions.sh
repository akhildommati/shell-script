#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
then
echo "$2......FAILURE"
exit 1
else 
echo "$2......SUCCESS"
fi
}

if [ $USERID -ne 0 ]
then
echo "ERROR ::You need to have root privileges to run this script"
exit 1 # other than zero
fi

dnf list installed mysql

if [ $? -ne 0 ] # not installed
then
dnf install mysql -y
VALIDATE $? "Installing Mysql"
else
echo "MySQL is already....... installed"
fi


dnf list installed git
if [ $? -ne 0 ]
then
dnf install git -y
VALIDATE $? "Installing GIT"
else    
echo "GIT is already....... installed"
fi

