#!/bin/bash
# Installs a lot of stuff

sudo apt update && sudo apt -y upgrade

sudo apt install -y chrome-gnome-shell
sudo apt install -y clang
sudo apt install -y colordiff
sudo apt install -y curl
sudo apt install -y gimp
sudo apt install -y git
sudo apt install -y gnome-tweak-tool
sudo apt install -y gparted
sudo apt install -y grub-customizer
sudo apt install -y htop
sudo apt install -y neovim
sudo apt install -y openjdk-11-jdk
sudo apt install -y pulseaudio-equalizer
sudo apt install -y qbittorrent
sudo apt install -y redshift redshift-gtk
sudo apt install -y solaar
sudo apt install -y steam
sudo apt install -y texlive texlive-full
sudo apt install -y texstudio
sudo apt install -y tig
sudo apt install -y tilix
sudo apt install -y tlp tlp-rdw
sudo apt install -y tmux
sudo apt install -y ubuntu-restricted-extras
sudo apt install -y vim vim-gtk
sudo apt install -y vlc
sudo apt install -y xclip
sudo apt install -y zsh

# GNOME extensions
# user themes
# caffeine

# .debs: ---------

# Chrome
# VS Code

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# PPAs -----------

sudo add-apt-repository -y ppa:communitheme/ppa
sudo apt update
sudo apt install -y ubuntu-communitheme-session

sudo add-apt-repository ppa:system76/pop
sudo apt update
sudo apt install pop-icon-theme

sudo add-apt-repository ppa:libreoffice/ppa
sudo apt update
sudo apt install libreoffice

# Other ----------

# Add fonts to ~/.local/share/fonts/
# Update cache
fc-cache -fv

# Install oh-my-zsh
# Install spaceship prompt
# Install bash-it

# Install powerline and neovim
pip install powerline-status
pip install neovim

# Install Miniconda
# Update conda
conda update conda
conda update --all

# Start tlp
sudo tlp start

# Clean
sudo apt -y autoremove
sudo apt -y clean
