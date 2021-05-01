#!/bin/bash
# Installs a lot of stuff

sudo apt update && sudo apt -y upgrade

sudo apt install -y avidemux2.7
sudo apt install -y baobab
sudo apt install -y build-essential
sudo apt install -y calibre
sudo apt install -y clang
sudo apt install -y clangd-11
sudo apt install -y clang-format
sudo apt install -y cmake
sudo apt install -y colordiff
sudo apt install -y cppcheck
sudo apt install -y curl
sudo apt install -y dconf-editor
sudo apt install -y docker docker-compose
sudo apt install -y gaupol
sudo apt install -y gdb
sudo apt install -y gdebi
sudo apt install -y gimp
sudo apt install -y git
sudo apt install -y gnome-tweak-tool
sudo apt install -y gparted
sudo apt install -y htop
sudo apt install -y libreoffice
sudo apt install -y meld
sudo apt install -y llvm
sudo apt install -y ninja-build
sudo apt install -y nodejs
sudo apt install -y openconnect
sudo apt install -y psensor
sudo apt install -y pulseaudio-equalizer
sudo apt install -y python-neovim
sudo apt install -y python3-neovim
sudo apt install -y qbittorrent
sudo apt install -y ranger
sudo apt install -y rsync
sudo apt install -y simple-scan
sudo apt install -y simplescreenrecorder
sudo apt install -y steam
sudo apt install -y texlive texlive-full
sudo apt install -y texstudio
sudo apt install -y tig
sudo apt install -y tilix
sudo apt install -y tlp tlp-rdw
sudo apt install -y tmux
sudo apt install -y tree
sudo apt install -y ubuntu-restricted-extras
sudo apt install -y uncrustify
sudo apt install -y valgrind
sudo apt install -y vim vim-gtk
sudo apt install -y vlc
sudo apt install -y words
sudo apt install -y xclip
sudo apt install -y xfce4-terminal
sudo apt install -y zsh

# -- Snaps
sudo snap install spotify

# -- Install Neovim (newer version)
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt upgrade

# -- Install Papirus Icon Theme
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme

# -- Install Chrome
# https://www.google.com/chrome/

# -- Install Etcher
# https://github.com/balena-io/etcher

# -- Install K2pdfopt
# https://www.willus.com/k2pdfopt/

# -- Install Mendeley
# https://www.mendeley.com/download-desktop-new/linux

# -- Install VS Code
# https://code.visualstudio.com/docs/setup/linux

# -- Install Nerdfonts (Fira Code)
# Get fonts: https://www.nerdfonts.com/font-downloads
# Place fonts in ~/.local/share/fonts/
# Run:
# fc-cache -fv

# -- Install Miniconda
# https://docs.conda.io/en/latest/miniconda.html
# Update conda
# conda update conda
# conda update --all

# -- Install Youtube-DL
# https://youtube-dl.org/

# -- Install Pip after conda
# pip install black
# pip install flake8
# pip install ipython
# pip install isort
# pip install jedi
# pip install jedi-language-server
# pip install jupyter
# pip install jupyterthemes
# pip install matplotlib
# pip install neovim
# pip install numpy
# pip install pandas
# pip install pylint
# pip install python-language-server

# -- Configure Prompt:

# - Install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# - Add spaceship theme to oh-my-zsh
# git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
# set ZSH_THEME="spaceship" in .zshrc

# - Add zsh-syntax-highlight plugin to oh-my-zsh
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# plugins=([plugins...] zsh-syntax-highlighting) in .zshrc

# - Add zsh-autosuggestions plugin to oh-my-zsh
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# plugins=([plugins...] zsh-autosuggestions) in .zshrc

# - Install bash-it
# git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
# ~/.bash_it/install.sh

# - Install vim-plug for vim and neovim
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# - Install tpm for tmux
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# -- Enable click to minimize in Ubuntu
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# -- Start tlp
sudo tlp start

# -- Clean up
sudo apt -y autoremove && sudo apt -y clean
