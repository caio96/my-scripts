#!/bin/bash
#Installs a lot of stuff

sudo apt-get update && sudo apt-get -y upgrade

#package managers
sudo apt-get install -y synaptic 
sudo apt-get install -y gdebi

#ubuntu
sudo apt-get install -y unity-tweak-tool
sudo apt-get install -y ubuntu-wallpapers*
sudo apt-get install -y ubuntu-restricted-extras

#topbar
sudo apt-get install -y redshift redshift-gtk #config file 
sudo apt-get install -y caffeine
sudo apt-get install -y indicator-keylock

#code
sudo apt-get install -y octave
sudo apt-get install -y git
sudo apt-get install -y tig
sudo apt-get install -y python2.7
sudo apt-get install -y ipython
sudo apt-get install -y arduino arduino-core
sudo apt-get install -y texlive
sudo apt-get install -y texstudio
sudo apt-get install -y graphviz
sudo apt-get install -y vim
sudo apt-get install -y valgrind
sudo apt-get install -y openjdk-8-jdk

#terminal
sudo apt-get install -y realpath
sudo apt-get install -y curl
sudo apt-get install -y htop

#video
sudo apt-get install -y vlc

#image
sudo apt-get install -y gimp 
sudo apt-get install -y inkscape

#torrent
sudo apt-get install -y qbittorrent

sudo apt-get install -y gufw 		#firewall
sudo apt-get install -y clamtk 		#antivirus
sudo apt-get install -y bleachbit	#cleaning

#compression/decompression
sudo apt-get install -y p7zip-rar p7zip-full unace unrar zip unzip
sudo apt-get install -y sharutils rar uudeview mpack arj cabextract file-roller

# sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.10/ /' > /etc/apt/sources.list.d/arc-theme.list" 
# wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.10/Release.key
# sudo apt-key add - < Release.key
# sudo apt-get update 
# sudo apt-get install -y arc-theme

# sudo add-apt-repository -y ppa:gnumdk/lollypop
# sudo apt-get update
# sudo apt-get install -y lollypop

# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
# echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# sudo apt-get update
# sudo apt-get install -y spotify-client

# sudo add-apt-repository -y ppa:linrunner/tlp
# sudo apt-get update
# sudo apt-get install -y tlp tlp-rdw
# sudo apt-get install -y tp-smapi-dkms acpi-call-dkms #Thinkpad additional

# sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
# sudo apt-get update
# sudo apt-get -y install sublime-text-installer

# sudo add-apt-repository -y ppa:openshot.developers/ppa
# sudo apt-get update
# sudo apt-get install -y openshot-qt

sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean