#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR ::You need to have root privileges to run this script"
exit 1 # other than zero
fi
dnf install mysql -y

if [ $? -ne 0 ]
then
echo "ERROR :: MySQL installation failed"
exit 1
else 
echo "MySQL installation successful"
fi

dnf install git -y

if [ $? -ne 0 ]
then
echo "ERROR :: GIT installation failed"
exit 1
else 
echo "GIT installation successful"
fi