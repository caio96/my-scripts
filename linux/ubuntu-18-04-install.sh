#!/bin/bash
# Installs a lot of stuff

sudo apt update && sudo apt -y upgrade

sudo apt install -y baobab
sudo apt install -y build-essential
sudo apt install -y chrome-gnome-shell
sudo apt install -y clang
sudo apt install -y clang-format
sudo apt install -y cmake
sudo apt install -y colordiff
sudo apt install -y cppcheck
sudo apt install -y curl
sudo apt install -y dconf-editor
sudo apt install -y docker docker-compose
sudo apt install -y gdb
sudo apt install -y gdebi
sudo apt install -y gimp
sudo apt install -y git
sudo apt install -y gnome-tweak-tool
sudo apt install -y gnome-shell-extensions
sudo apt install -y gparted
sudo apt install -y htop
sudo apt install -y libreoffice
sudo apt install -y llvm
sudo apt install -y neovim
sudo apt install -y ninja-build
sudo apt install -y nodejs
sudo apt install -y openjdk-11-jdk
sudo apt install -y pulseaudio-equalizer
sudo apt install -y qbittorrent
sudo apt install -y ranger
sudo apt install -y redshift-gtk
sudo apt install -y rsync
sudo apt install -y simple-scan
sudo apt install -y simplescreenrecorder
sudo apt install -y smartmontools
sudo apt install -y solaar
sudo apt install -y steam
sudo apt install -y texlive texlive-full
sudo apt install -y texstudio
sudo apt install -y tig
sudo apt install -y tilix
sudo apt install -y tlp tlp-rdw
sudo apt install -y tmux
sudo apt install -y ubuntu-restricted-extras
sudo apt install -y uncrustify
sudo apt install -y vim vim-gtk
sudo apt install -y vlc
sudo apt install -y xclip
sudo apt install -y xfce4-terminal
sudo apt install -y zsh

# -- GNOME extensions
# suspend button
# caffeine

# -- .debs
# Chrome
# Mendeley Desktop
# VS Code

# -- Snaps
sudo snap install communitheme

# -- Avidemux
sudo add-apt-repository ppa:ubuntuhandbook1/avidemux
sudo apt update
sudo apt install -y avidemux2.7

# -- Etcher
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo apt update
sudo apt install -y balena-etcher-electron

# -- Grub Customizer
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt update
sudo apt install grub-customizer

# -- Pop Icons
sudo add-apt-repository ppa:system76/pop
sudo apt update
sudo apt install pop-icon-theme

# -- Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn

# -- Neovim
# for a newer version
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt upgrade

# -- Spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install -y spotify-client

# -- Install:
# oh-my-zsh
# spaceship prompt
# zsh-syntax-highlight
# zsh-autosuggestions
# bash-it
# vim-plug for vim and neovim
# tpm for tmux

# Install Miniconda
# Update conda
conda update conda
conda update --all

# Get fonts here: https://www.nerdfonts.com/font-downloads
# Place fonts in ~/.local/share/fonts/
fc-cache -fv

# -- Pip
pip install neovim

# Fix dash-to-dock
# open dconf editor
# org -> gnome -> shell -> extensions -> dash-to-dock
# change click-action to minize
# change scroll-action to cycle-windows

# Start tlp
sudo tlp start

# Clean
sudo apt -y autoremove && sudo apt -y clean
