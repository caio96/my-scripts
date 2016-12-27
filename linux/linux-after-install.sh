#!/bin/bash
# Installs a lot of stuff

sudo apt-get update && sudo apt-get -y upgrade

# Package managers
sudo apt-get install -y synaptic
sudo apt-get install -y gdebi

# Ubuntu
sudo apt-get install -y unity-tweak-tool
sudo apt-get install -y ubuntu-restricted-extras

# Topbar
sudo apt-get install -y redshift redshift-gtk #config file
sudo apt-get install -y caffeine
sudo apt-get install -y indicator-keylock
sudo apt-get install -y variety
# sudo add-apt-repository -y ppa:atareao/atareao
# sudo apt-get update
# sudo apt-get -y install my-weather-indicator

# Code
sudo apt-get install -y git
sudo apt-get install -y tig
sudo apt-get install -y python2.7
sudo apt-get install -y python3.5
sudo apt-get install -y ipython
sudo apt-get install -y ipython3
sudo apt-get install -y texlive
sudo apt-get install -y texlive-full
sudo apt-get install -y texstudio
sudo apt-get install -y graphviz
sudo apt-get install -y vim
sudo apt-get install -y valgrind
sudo apt-get install -y openjdk-8-jdk

# Terminal
sudo apt-get install -y realpath
sudo apt-get install -y curl
sudo apt-get install -y htop
sudo apt-get install -y tmux
sudo apt-get install -y colordiff

# Video
sudo apt-get install -y vlc

# Image
sudo apt-get install -y gimp
sudo apt-get install -y inkscape

# Torrent
sudo apt-get install -y qbittorrent

sudo apt-get install -y gufw        #firewall
sudo apt-get install -y clamtk      #antivirus
sudo apt-get install -y bleachbit   #cleaning

# Power
sudo apt-get install -y tlp tlp-rdw
sudo apt-get install -y tp-smapi-dkms acpi-call-dkms #Thinkpad additional
sudo tlp start

# Web
sudo apt-get install -y php
sudo apt-get install -y apache2
sudo apt-get install -y phpmyadmin
sudo apt-get install -y mysql-server php-mysql

# Compression
sudo apt-get install -y p7zip-rar p7zip-full

# Partition manager
sudo apt-get install -y gparted

# sudo apt-add-repository -y ppa:numix/ppa
# sudo apt-get update
# sudo apt-get install -y numix-icon-theme-circle numix-gtk-theme

# sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
# sudo apt-get update
# sudo apt-get -y install sublime-text-installer

# sudo add-apt-repository -y ppa:webupd8team/atom
# sudo apt-get update
# sudo apt-get install -y atom

# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
# echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# sudo apt-get update
# sudo apt-get install -y spotify-client

# sudo add-apt-repository -y ppa:nilarimogard/webupd8
# sudo apt-get update
# sudo apt-get install -y pulseaudio-equalizer

sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean
