#!/bin/bash

username=$1 
pass=$2
password=$(perl -e 'print crypt($ARGV[0], "password")', $pass)
directories='Downloads Desktop Public Pictures Videos Music Documents'


create_user(){
    echo "Creating user $username"
    sleep 5
    sudo useradd -m $username -p $password
    for i in $directories;
    do 
        sudo mkdir /home/$username/$i
        echo "Created /home/$username/$i"
    done
    sleep 2
    echo "Created User: "
    echo "--Username: $username"
    echo "--Home Directory: /home/$username"
    echo "--Password: $password" 
}

case "$1" in
    # "-l")
    #     echo "This is a list"
    #     cat $2 | while read line
    #     do
    #         echo $line
    #         mkdir ./$line
    #         rm -rf ./$line
    #     done
    # ;;
    "-h")
        echo "---------------------------------------------"
        echo "-l: Point to a .list file"
        echo "-h: Help menu"
        echo "ex: sh delete_user.sh [USERNAME]"
        echo "---------------------------------------------"
    ;;
    "")
        echo "---------------------------------------------"
        echo "Please add an argument or use the help menu"
        echo "-l: Point to a .list file"
        echo "-h: Help menu"
        echo "---------------------------------------------"
    ;;

esac

#if number of args are 0 or 1 
if [ $# -eq 0 ] || [ $# -eq 1 ];
then 
    echo "------------------------------------------------------"
    echo "Please enter in an argument for username AND password."
    echo "ex: sh create_user.sh [USERNAME] [PASSWORD]"
    echo "------------------------------------------------------"
    exit 2
fi

#if root is running the script, create_user
if [ $(id -u) -eq 0 ];
then
    create_user
else
    echo "Only root may add a user to the system"
    exit 2
fi
