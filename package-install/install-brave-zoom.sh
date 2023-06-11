#!/bin/bash

zoom_install(){
	wget https://zoom.us/client/latest/zoom_x86_64.rpm 
	sudo dnf localinstall zoom_x86_64.rpm 
}

brave_install(){
	
	sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

	sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

	sudo dnf install brave-browser

}