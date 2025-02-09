#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR ::You need to have root privileges to run this script"
fi
dnf install mysql -y