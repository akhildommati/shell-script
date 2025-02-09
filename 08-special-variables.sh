#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables passed to the script: $#"
echo "Name of the script: $0"
echo "PID of the script: $$"
echo "Exit status of the last command: $?"
sleep 60 &
echo "Process ID of the last command: $!"
echo "Last argument of the last command: $_"
echo "Last argument of the last command: $-"
echo "Last argument of the last command: $*"
echo "Last argument of the last command: $?"
echo "present working directory: $PWD"
echo "Home directory: $HOME"
echo "User name: $USER"
