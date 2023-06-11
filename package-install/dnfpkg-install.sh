#!/bin/bash

#read list of packages
#xargs feed the lines into the command
DISTRO=$( cat /etc/*-release | tr [:upper:] [:lower:] | grep -Poi '(debian|ubuntu|red hat|centos|fedora|arch)' | uniq )

case "$DISTRO" in 
	"fedora") 
		echo "This is fedora" 
		echo "Using dnf to install packages"
		cat packages.list | xargs sudo dnf -y install 
	;;
	"debian")
		echo "This is debian"
		echo "Using apt to install packages" 
		cat packages.list | xargs sudo apt-get -y install
	;;
esac
