#!/bin/bash

#read list of packages
#xargs feed the lines into the command
DISTRO=$( cat /etc/*-release | tr [:upper:] [:lower:] | grep -Poi '(debian|ubuntu|red hat|centos|fedora|arch)' | uniq )


zoom_install(){
	wget https://zoom.us/client/latest/zoom_x86_64.rpm 
	sudo dnf localinstall zoom_x86_64.rpm 
}

brave_install(){
	
	sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

	sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

	sudo dnf install brave-browser

}

case "$DISTRO" in 
	"fedora") 
		echo "This is fedora" 
		echo "Using dnf to install packages"
		cat packages.list | xargs sudo dnf -y install 
		zoom_install
		brave_install
	;;
	"debian")
		echo "This is debian"
		echo "Using apt to install packages" 
		cat packages.list | xargs sudo apt-get -y install
	;;
esac
