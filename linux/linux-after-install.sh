#!/bin/bash
# Installs a lot of stuff

sudo apt-get update && sudo apt-get -y upgrade

# Package managers
sudo apt-get install -y gdebi

# Ubuntu
sudo apt-get install -y unity-tweak-tool
sudo apt-get install -y ubuntu-restricted-extras

# Topbar
sudo apt-get install -y redshift redshift-gtk
sudo apt-get install -y caffeine
sudo apt-get install -y indicator-keylock
sudo apt-get install -y variety

# Git
sudo apt-get install -y git

# Latex
sudo apt-get install -y texlive texlive-full
sudo apt-get install -y texstudio

# Graph drawing
sudo apt-get install -y graphviz

# Vim
sudo apt-get install -y vim vim-gtk

# Open jdk 8
sudo apt-get install -y openjdk-8-jdk

# Python
sudo apt-get install -y python2.7
sudo apt-get install -y python3.5

# Terminal commands
sudo apt-get install -y tig
sudo apt-get install -y realpath
sudo apt-get install -y curl
sudo apt-get install -y htop
sudo apt-get install -y tmux
sudo apt-get install -y colordiff
sudo apt-get install -y ssh

# Video
sudo apt-get install -y vlc

# Image editing
sudo apt-get install -y gimp
sudo apt-get install -y inkscape

# Torrent client
sudo apt-get install -y qbittorrent

# Firewall
sudo apt-get install -y gufw

# Antivirus
sudo apt-get install -y clamtk

# Power saving
sudo apt-get install -y tlp tlp-rdw
sudo apt-get install -y tp-smapi-dkms acpi-call-dkms #Thinkpad additional
sudo tlp start

# Partition manager
sudo apt-get install -y gparted

# Logitech devices
sudo apt-get install -y solaar

# Weather indicator
# sudo add-apt-repository -y ppa:atareao/atareao
# sudo apt-get update
# sudo apt-get -y install my-weather-indicator

# Finds pictures duplicates
# sudo apt-add-repository -y ppa:hsoft/ppa
# sudo apt-get update
# sudo apt-get install -y dupeguru-pe

# Java
# sudo add-apt-repository -y ppa:webupd8team/java
# sudo apt-get update
# sudo apt-get install oracle-java8-installer

# IntelliJ
# sudo add-apt-repository -y ppa:mmk2410/intellij-idea
# sudo apt-get update
# sudo apt-get install -y intellij-idea-community

# Numix theme
# sudo apt-add-repository -y ppa:numix/ppa
# sudo apt-get update
# sudo apt-get install -y numix-icon-theme-circle numix-gtk-theme

# Sublime text
# wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
# echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
# sudo apt-get update
# sudo apt-get install -y sublime-text

# Atom
# sudo add-apt-repository -y ppa:webupd8team/atom
# sudo apt-get update
# sudo apt-get install -y atom

# Spotify
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
# echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# sudo apt-get update
# sudo apt-get install -y spotify-client

# PulseAudio Equalizer
# sudo add-apt-repository -y ppa:nilarimogard/webupd8
# sudo apt-get update
# sudo apt-get install -y pulseaudio-equalizer

sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean
