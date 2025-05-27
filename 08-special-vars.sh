#!/bin/bash

echo "all variables passed to the script : $@"

echo "how many number of variables passed to the script : $#"

echo "name of this scipt : $0"

echo "current directory : $PWD"

echo "user who is running the scipt : $USER"

echo "home diretory of the $USER user is : $HOME"

echo "PID of the script : $$"

sleep 15 &

echo "PID of the last script running in background : $!"

echo "all variables : $*"