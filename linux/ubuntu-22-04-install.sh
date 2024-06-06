#!/bin/bash
# Setup ubuntu 22.04

## Update ====================================================== #

sudo apt update && sudo apt -y upgrade

## Install stuff =============================================== #

# Install apt packages
sudo apt install -y baobab
sudo apt install -y bat
sudo apt install -y bison
sudo apt install -y build-essential
sudo apt install -y calibre
sudo apt install -y cheese
sudo apt install -y "clang*15"
sudo apt install -y libclang-15-dev
sudo apt install -y cmake
sudo apt install -y chrome-gnome-shell
sudo apt install -y curl
sudo apt install -y docker docker-compose
sudo apt install -y exa
sudo apt install -y fd-find
sudo apt install -y gdb
sudo apt install -y gimp
sudo apt install -y git git-lfs
sudo apt install -y git-extras
sudo apt install -y gnome-tweaks
sudo apt install -y gparted
sudo apt install -y htop
sudo apt install -y libfuse2
sudo apt install -y libgmp-dev
sudo apt install -y libreoffice
sudo apt install -y libstdc++-12-dev
sudo apt install -y libtool libtool-bin
sudo apt install -y linux-tools-common linux-tools-generic
sudo apt install -y lld-15
sudo apt install -y "llvm*15*"
sudo apt install -y locate
sudo apt install -y neofetch
sudo apt install -y ninja-build
sudo apt install -y pdfgrep
sudo apt install -y pdftk
sudo apt install -y powertop
sudo apt install -y python3
sudo apt install -y ranger
sudo apt install -y ripgrep
sudo apt install -y rsync
sudo apt install -y simple-scan
sudo apt install -y steam
sudo apt install -y texlive texlive-full
sudo apt install -y tig
sudo apt install -y tilix
sudo apt install -y tlp
sudo apt install -y tmux
sudo apt install -y tree
sudo apt install -y ubuntu-restricted-extras
sudo apt install -y vim vim-gtk
sudo apt install -y vlc
sudo apt install -y xclip
sudo apt install -y zsh
sudo apt install -y zoxide

# -- Snaps
sudo snap install bash-language-server --classic
sudo snap install code --classic
sudo snap install discord
sudo snap install go --classic
sudo snap install node --classic
sudo snap install pomotroid
sudo snap install --channel=edge shellcheck
sudo snap install slack
sudo snap install spotify

# -- Install Chrome
# get .deb from https://www.google.com/chrome/
# sudo apt install ./file.deb
# Disable handling of multimedia keys
# go to chrome://flags/ and disable Hardware Media Key Handling

# -- Install Papirus Icon Theme
# https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install papirus-icon-theme papirus-folders
# change color of folder icons to yaru
papirus-folders -C nordic --theme Papirus-Dark
# change theme in gnome-tweaks

# -- Install neovim
# get lastest neovim appimage from https://github.com/neovim/neovim/releases
# put appimage in ~/.local/bin

# -- Install Wezterm
# get .deb from https://wezfurlong.org/wezterm/installation.html
# sudo apt install ./file.deb

# -- Install Zotero
# get .tar.gz from https://www.zotero.org/download/
# extract it
# sudo mv zotero-extracted /opt/zotero
cd /opt/zotero/
./set_launcher_icon
ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
# -- Install zotero night plugin
# get .xpi file from https://github.com/tefkah/zotero-night/releases
# in Zotero add it as an add-on

# -- Install Zoom
# https://zoom.us/download
# sudo apt install ./file.deb

# -- Install Nerdfonts (Fira Code)
# Get fonts: https://www.nerdfonts.com/font-downloads
# Place fonts in ~/.fonts/
# Run:
fc-cache -fv

## Configure =================================================== #

# -- Configure Docker
# https://docs.docker.com/engine/install/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker "$USER"

# -- Setup ssh keys
# Copy ssh folder if there is a backup
# Make permissions correct
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
chmod 644 ~/.ssh/config

# -- Setup Gnome terminal
# Add Gruvbox theme
# Set theme to Gruvbox Dark with gogh:
# https://github.com/Gogh-Co/Gogh
export TERMINAL="gnome-terminal"
bash -c "$(wget -qO- https://git.io/vQgMr)"
# Set font to FiraCode Nerd Font 11

# -- Setup Tilix
# Set theme to Gruvbox Dark with gogh:
# https://github.com/Gogh-Co/Gogh
bash -c "$(wget -qO- https://git.io/vQgMr)"
# Set font to FiraCode Nerd Font Regular 11

# -- Enable click to minimize
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
# -- Cycle windows on scroll on dock
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'

# -- Remap caps lock to ctrl, and both shifts to caps lock in gnome tweaks
# Go to gnome-tweaks -> Keyboard & Mouse -> Additional layout options

# -- Enable tlp
sudo tlp start
sudo systemctl enable tlp.service

# -- Make Dash nice
# Enable dash to dock with gnome shell extensions
# Disable ubuntu-dock
sudo mv /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com.bak
# Enable user shell themes in the gnome shell extension

# -- Install pop gtk theme
sudo apt install sassc meson libglib2.0-dev
git clone https://github.com/pop-os/gtk-theme.git
cd gtk-theme
meson build && cd build
ninja
ninja install
# Set shell theme to Pop and application theme to PopDark in gnome tweaks

# Setup teminal ================================================ #

# - Install starship for bash
# https://starship.rs/
curl https://starship.rs/install.sh -o /tmp/install.sh
sh /tmp/install.sh -b "$HOME"/.local/bin

# - Install oh-my-zsh
# https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# - Add spaceship theme to oh-my-zsh
# https://spaceship-prompt.sh/
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
# set ZSH_THEME="spaceship" in .zshrc

# - Add zsh-syntax-highlight plugin to oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
# plugins=([plugins...] zsh-syntax-highlighting) in .zshrc

# - Add zsh-autosuggestions plugin to oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
# plugins=([plugins...] zsh-autosuggestions) in .zshrc

# - Install tpm for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Setup dotfiles =============================================== #

# Download my dot files
mkdir -p "$HOME/git"
DOT_FILES="$HOME/git/dot-files"
git clone git@github.com:caio96/dot-files.git "$DOT_FILES"

mv "$HOME"/.bash_logout "$HOME"/.bash_logout.bak
mv "$HOME"/.bashrc "$HOME"/.bashrc.bak 
mv "$HOME"/.profile "$HOME"/.profile.bak
mv "$HOME"/.zshrc "$HOME"/.zshrc.bak

ln -s "$DOT_FILES"/.aliases "$HOME"/.aliases
ln -s "$DOT_FILES"/.bash_logout "$HOME"/.bash_logout
ln -s "$DOT_FILES"/.bashrc "$HOME"/.bashrc
ln -s "$DOT_FILES"/.condarc "$HOME"/.condarc
ln -s "$DOT_FILES"/.gitconfig "$HOME"/.gitconfig
ln -s "$DOT_FILES"/.hidden "$HOME"/.hidden
ln -s "$DOT_FILES"/.profile "$HOME"/.profile
ln -s "$DOT_FILES"/.tigrc "$HOME"/.tigrc
ln -s "$DOT_FILES"/.tmux.conf "$HOME"/.tmux.conf
ln -s "$DOT_FILES"/.vimrc "$HOME"/.vimrc
ln -s "$DOT_FILES"/.wezterm.lua "$HOME"/.wezterm.lua
ln -s "$DOT_FILES"/.zshrc "$HOME"/.zshrc

ln -s "$DOT_FILES"/.config/spaceship.zsh "$HOME"/.config/spaceship.zsh
ln -s "$DOT_FILES"/.config/starship.toml "$HOME"/.config/starship.toml
mkdir -p "$HOME"/.config/Code/User
ln -s "$DOT_FILES"/.config/Code/User/settings.json "$HOME"/.config/Code/User/settings.json

ln -s ~/git/dot-files/.config/nvim ~/.config/nvim

ln -s "$DOT_FILES"/.oh-my-zsh/custom/syntax-highlight.zsh "$ZSH_CUSTOM"/syntax-highlight.zsh

tmux start-server
tmux new-session -d
"$HOME"/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server
ln -s "$DOT_FILES"/.tmux/plugins/tmux/themes/catppuccin_gruvbox.tmuxtheme "$HOME"/.tmux/plugins/tmux/themes/catppuccin_gruvbox.tmuxtheme

# ============================ Shell Utils ============================= #

# -- Install gdb-dashboard
# https://github.com/cyrus-and/gdb-dashboard
wget -P ~ https://git.io/.gdbinit

# -- Install Ultimate Plumber
# https://github.com/akavel/up
wget https://github.com/akavel/up/releases/latest/download/up -o ~/.local/bin/up
chmod +x ~/.locat/bin/up

# -- Install Navi
# https://github.com/denisidoro/navi
bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)

# -- Install nnn
# https://github.com/jarun/nnn/releases
# get latest static release and move it to ~/.local/bin

# -- Install neovide
# get appimage from https://github.com/neovide/neovide/releases

# -- Install broot
# https://dystroy.org/broot/

# -- Install Miniconda
# https://docs.conda.io/en/latest/miniconda.html
# bash install-script.sh -p $HOME/.anaconda3
# Update conda
conda update conda
conda update --all

# -- Install with pip
pip install ipython
pip install matplotlib
pip install neovim
pip install numpy
pip install pandas
pip install pygments # gdb-dashboard dependency
pip install thefuck
pip install tldr
pip install howdoi

# -- Install Gitui
# Download musl.tar.gz file from https://github.com/extrawurst/gitui/releases
# Extract it
# Put it in ~/.local/bin

# -- Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# -- Install with node
sudo npm install --global fkill-cli

# =========================== Bug fixes =========================== #

# -- Fix for jumpy scrolling
# https://extensions.gnome.org/extension/5282/alttab-scroll-workaround/

# -- Fix nvidia sleep/wakeup on black screeen
# Install nvidia drivers
sudo ubuntu-drivers list # shows available drivers
sudo ubuntu-drivers install nvidia:525
# add to /etc/default/grub
# GRUB_CMDLINE_LINUX_DEFAULT="nouveau.blacklist=1 acpi_osi=Linux nouveau.modeset=0"
# run
sudo update-grub
# disable nvidia suspension services
sudo systemctl disable nvidia-suspend
sudo systemctl disable nvidia-hibernate
sudo systemctl disable nvidia-resume
# add "exit" to the beginning of the script /usr/bin/nvidia-sleep.sh

# -- Stop messing with the time in Windows (in dual boot)
timedatectl set-local-rtc 1

# =========================== Clean up =========================== #

sudo apt -y autoremove && sudo apt -y clean

# =========================== Optional software =========================== #

# -- Install Open Broadcaster Software Studio
# https://obsproject.com/wiki/install-instructions#linux
# sudo apt install -y v4l2loopback-dkms
# sudo add-apt-repository ppa:obsproject/obs-studio
# sudo apt update
# sudo apt install obs-studio

# -- Install Etcher
# https://github.com/balena-io/etcher
# curl -1sLf 'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' | sudo -E bash
# sudo apt update
# sudo apt install balena-etcher-electron

# -- Install K2pdfopt
# https://www.willus.com/k2pdfopt/

# -- Install Go
# https://go.dev/dl/
# move extracted dir to /opt/
# set gopath to .go
# go env -w GOPATH=$HOME/.go
# install pprof after go
# go install github.com/google/pprof@latest

# -- Install Youtube-DL
# https://youtube-dl.org/
# pip install youtube_dl

# --  Install Darktable
# https://www.darktable.org/

