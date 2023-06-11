#!/bin/bash

delete_list_user(){
    cat $file | xargs sudo killall -u 
    cat $file | xargs userdel -r
}

    
case "$1" in
    "-l")
        echo "This is a list"
        cat $2 | while read line
        do
            echo $line
            mkdir ./$line
            rm -rf ./$line
        done
    ;;
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
