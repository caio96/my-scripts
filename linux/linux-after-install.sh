#!/bin/bash
# Installs a lot of stuff

sudo apt update && sudo apt -y upgrade

# Package managers
sudo apt install -y gdebi
sudo apt install -y snap

# Ubuntu
sudo apt install -y unity-tweak-tool
sudo apt install -y ubuntu-restricted-extras

# Topbar
sudo apt install -y redshift redshift-gtk
sudo apt install -y caffeine
sudo apt install -y indicator-keylock
sudo apt install -y variety

# Git
sudo apt install -y git

# Latex
sudo apt install -y texlive texlive-full
sudo apt install -y texstudio

# Graph drawing
sudo apt install -y graphviz

# Vim
sudo apt install -y vim vim-gtk

# Open jdk 8
sudo apt install -y openjdk-8-jdk

# Python
sudo apt install -y python2.7
sudo apt install -y python3.5

# Terminal
sudo apt install -y tilda

# Terminal commands
sudo apt install -y tig
sudo apt install -y realpath
sudo apt install -y curl
sudo apt install -y htop
sudo apt install -y tmux
sudo apt install -y colordiff
sudo apt install -y ssh

# Video
sudo apt install -y vlc

# Image editing
sudo apt install -y gimp
sudo apt install -y inkscape

# Torrent client
sudo apt install -y qbittorrent

# Firewall
sudo apt install -y gufw

# Antivirus
sudo apt install -y clamtk

# Power saving
sudo apt install -y tlp tlp-rdw
sudo apt install -y tp-smapi-dkms acpi-call-dkms #Thinkpad additional
sudo tlp start

# Partition manager
sudo apt install -y gparted

# Logitech devices
sudo apt install -y solaar

# Snaps
# Atom
sudo snap install --classic atom

# VS Code - .deb
# Sublime3 - .deb

# GCC 7
# sudo add-apt-repository ppa:ubuntu-toolchain-r/test
# sudo apt update
# sudo apt -y install gcc-7 g++-7

# Weather indicator
# sudo add-apt-repository -y ppa:atareao/atareao
# sudo apt update
# sudo apt -y install my-weather-indicator

# Finds pictures duplicates
# sudo apt-add-repository -y ppa:hsoft/ppa
# sudo apt update
# sudo apt install -y dupeguru-pe

# Java
# sudo add-apt-repository -y ppa:webupd8team/java
# sudo apt update
# sudo apt install oracle-java8-installer

# IntelliJ
# sudo add-apt-repository -y ppa:mmk2410/intellij-idea
# sudo apt update
# sudo apt install -y intellij-idea-community

# Numix theme
# sudo apt-add-repository -y ppa:numix/ppa
# sudo apt update
# sudo apt install -y numix-icon-theme-circle numix-gtk-theme

# Spotify
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
# echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# sudo apt update
# sudo apt install -y spotify-client

# PulseAudio Equalizer
# sudo add-apt-repository -y ppa:nilarimogard/webupd8
# sudo apt update
# sudo apt install -y pulseaudio-equalizer

sudo apt -y autoremove
sudo apt -y clean
