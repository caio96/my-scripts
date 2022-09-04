#!/bin/bash
# Installs a lot of stuff

sudo apt update && sudo apt -y upgrade

sudo apt install -y baobab
sudo apt install -y build-essential
sudo apt install -y calibre
sudo apt install -y chesse
sudo apt install -y clang
sudo apt install -y "clang*12"
sudo apt install -y libclang-12-dev
sudo apt install -y cmake
sudo apt install -y colordiff
sudo apt install -y cppcheck
sudo apt install -y curl
sudo apt install -y dconf-editor
sudo apt install -y docker docker-compose
sudo apt install -y ffmpeg
sudo apt install -y flameshot
sudo apt install -y gaupol
sudo apt install -y gdb
sudo apt install -y gdebi
sudo apt install -y gimp
sudo apt install -y git git-lfs
sudo apt install -y gnome-tweak-tool
sudo apt install -y google-perftools
sudo apt install -y gparted
sudo apt install -y htop
sudo apt install -y libreoffice
sudo apt install -y libtool libtool-bin
sudo apt install -y linux-tools-common linux-tools-generic
sudo apt install -y lld-12
sudo apt install -y llvm
sudo apt install -y "llvm*12*"
sudo apt install -y locate
sudo apt install -y meld
sudo apt install -y neofetch
sudo apt install -y ninja-build
sudo apt install -y openconnect
sudo apt install -y pdftk
sudo apt install -y psensor
sudo apt install -y pulseaudio-equalizer
sudo apt install -y python3 python3-pip python3-dev python3-neovim
sudo apt install -y qbittorrent
sudo apt install -y rsync
sudo apt install -y simple-scan
sudo apt install -y steam
sudo apt install -y texlive texlive-full
sudo apt install -y tig
sudo apt install -y tilix
sudo apt install -y tlp tlp-rdw
sudo apt install -y tmux
sudo apt install -y tree
sudo apt install -y ubuntu-restricted-extras
sudo apt install -y uncrustify
sudo apt install -y vim vim-gtk
sudo apt install -y vlc
sudo apt install -y xclip
sudo apt install -y zsh

# -- Snaps
sudo snap install intellij-idea-community --classic
sudo snap install node --classic --channel=14
sudo snap install slack --classic
sudo snap install spotify

# -- Install Neovim (newer version)
# https://github.com/neovim/neovim/wiki/Installing-Neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim

# -- Install Open Broadcaster Software Studio
# https://obsproject.com/wiki/install-instructions#linux
sudo apt install -y v4l2loopback-dkms
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install obs-studio

# -- Install Papirus Icon Theme
# https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install papirus-icon-theme papirus-folders
# change color of folder icons to yaru
papirus-folders -C yaru --theme Papirus

# -- Install Chrome
# https://www.google.com/chrome/
# Disable handling of multimedia keys
# go to chrome://flags/ and disable Hardware Media Key Handling

# -- Install Etcher
# https://github.com/balena-io/etcher
# curl -1sLf 'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' | sudo -E bash
# sudo apt update
# sudo apt install balena-etcher-electron

# -- Install K2pdfopt
# https://www.willus.com/k2pdfopt/

# -- Install Mendeley
# https://www.mendeley.com/download-desktop-new/linux

# -- Install Bat
# https://github.com/sharkdp/bat/releases

# -- Install Nerdfonts (Fira Code)
# Get fonts: https://www.nerdfonts.com/font-downloads
# Place fonts in ~/.fonts/
# Run:
# fc-cache -fv

# -- Install Miniconda
# https://docs.conda.io/en/latest/miniconda.html
# Update conda
# conda update conda
# conda update --all

# -- Install Rescue Time
# https://www.rescuetime.com/download_linux

# -- Install VS Code
# https://code.visualstudio.com/docs/setup/linux

# -- Install Youtube-DL
# https://youtube-dl.org/

# -- Install Zoom
# https://zoom.us/download

# -- Install Go
# https://go.dev/dl/
# move extracted dir to /opt/
# set gopath to .go
# go env -w GOPATH=$HOME/.go
# install pprof after go
# go install github.com/google/pprof@latest

# -- Install Pip after conda
# pip install black
# pip install flake8
# pip install ipython
# pip install isort
# pip install jupyter
# pip install jupyterthemes
# pip install matplotlib
# pip install neovim
# pip install numpy
# pip install pandas
# pip install pylint
# pip install python-language-server
# pip install youtube_dl

# -- Configure Docker
# https://docs.docker.com/engine/install/linux-postinstall/
# sudo groupadd docker
# sudo usermod -aG docker $USER

# -- Configure Prompt:

# - Install oh-my-zsh
# https://ohmyz.sh/#install
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

# - Install starship for bash
# curl https://starship.rs/install.sh -o install.sh
# sh install.sh -b $HOME/.local/bin

# - Install vim-plug for vim and neovim
# https://github.com/junegunn/vim-plug
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# - Install tpm for tmux
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# -- Retain less olders version in snap
sudo snap set system refresh.retain=2

# -- Enable click to minimize in Ubuntu
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# -- Stop showing mounted drives on dock
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false

# -- Start tlp
sudo tlp start

# -- Clean up
sudo apt -y autoremove && sudo apt -y clean
