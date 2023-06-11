#!/bin/bash

username=$1 

delete_user(){

    echo "Deleting user $username"
    sleep 5
    sudo killall -u $username
    userdel -r $username
    sleep 3
    echo "Deleted User:"
    echo "--Username: $username"
    echo "--Removed $username's Home Directory: /home/$username"

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

#add conditional for:  cat users.list | xargs - allow users to supply list of usernames to delete
#if number of args are 0 or 1 
if [ $# -eq 0 ];
then 
    echo "---------------------------------------------------------------"
    echo "Please enter in an argument for the username you wish to delete"
    echo "ex: sh delete_user.sh [USERNAME]"
    echo "---------------------------------------------------------------"
    exit 2
fi

#if root is running the script, create_user
if [ $(id -u) -eq 0 ];
then
    delete_user
else
    echo "Only root may delete a user from the system"
    exit 2
fi
