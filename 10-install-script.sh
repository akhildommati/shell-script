#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR ::You need to have root privileges to run this script"
exit 1 # other than zero
fi

dnf list installed mysql

if [ $? -ne 0 ] # not installed
then
dnf install mysql -y
if [ $? -ne 0 ]
then
echo "ERROR :: MySQL installation failed"
exit 1
else 
echo "MySQL installation successful"
fi
else
echo "MySQL is already installed"
fi
# if [ $? -ne 0 ]
# then
# echo "ERROR :: MySQL installation failed"
# exit 1
# else 
# echo "MySQL installation successful"
# fi

dnf list installed git
if [ $? -ne 0 ]
then
dnf install git -y
if [ $? -ne 0 ]
then
echo "ERROR :: GIT installation failed"
exit 1
else 
echo "GIT installation successful"
fi
else    
echo "GIT is already installed"
fi



# if [ $? -ne 0 ]
# then
# echo "ERROR :: GIT installation failed"
# exit 1
# else 
# echo "GIT installation successful"
# fi