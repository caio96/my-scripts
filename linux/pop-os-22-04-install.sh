#!/bin/bash
# Setup pop os 22.04

# =========================== Update =========================== #

sudo apt update && sudo apt -y upgrade

# =========================== Install software =========================== #

# Install apt packages
sudo apt install -y baobab
sudo apt install -y bat
sudo apt install -y build-essential
sudo apt install -y calibre
sudo apt install -y cheese
sudo apt install -y "clang*15"
sudo apt install -y libclang-15-dev
sudo apt install -y cmake
sudo apt install -y chrome-gnome-shell
sudo apt install -y curl
sudo apt install -y docker docker-compose
sudo apt install -y fd-find
sudo apt install -y gdb
sudo apt install -y gimp
sudo apt install -y git git-lfs
sudo apt install -y gnome-tweaks
sudo apt install -y gparted
sudo apt install -y htop
sudo apt install -y libfuse2
sudo apt install -y libreoffice
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

# -- Install Papirus Icon Theme
# https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install papirus-icon-theme papirus-folders
# change color of folder icons to yaru
papirus-folders -C nordic --theme Papirus-Dark
# change theme in gnome-tweaks

# -- Install spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.linux-postinstall
sudo apt update
sudo apt install spotify-client

# -- Install nodejs
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
sudo apt install -y nodejs

# -- Install vscode
# get .deb from https://code.visualstudio.com/
# sudo apt install ./file.deb

# -- Install Chrome
# get .db from https://www.google.com/chrome/
# sudo apt install ./file.deb
# Disable handling of multimedia keys
# go to chrome://flags/ and disable Hardware Media Key Handling

# -- Install neovim
# get lastest neovim from https://github.com/neovim/neovim/releases
# put appimage in ~/.local/bin

# -- Install Wezterm
# get .deb from https://wezfurlong.org/wezterm/installation.html
# sudo apt install ./file.deb

# -- Install Zotero
# get .tar.gz from https://www.zotero.org/download/
# extract it
# sudo mv zotero-extracted /opt/zotero
# cd /opt/zotero/
# ./set_launcher_icon
# ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
# -- Install zotero night plugin
# get .xpi file from https://github.com/tefkah/zotero-night/releases
# in Zotero add it as an add-on

# -- Install Discord
# get .deb from https://discord.com/
# sudo apt install ./file.deb

# -- Install Zoom
# https://zoom.us/download
# sudo apt install ./file.deb

# -- Install Nerdfonts (Fira Code)
# Get fonts: https://www.nerdfonts.com/font-downloads
# Place fonts in ~/.fonts/
# Run:
# fc-cache -fv

# -- Install Miniconda
# https://docs.conda.io/en/latest/miniconda.html
# bash install-script.sh -p $HOME/.anaconda3
# Update conda
# conda update conda
# conda update --all

# -- Install with pip
# pip install ipython
# pip install matplotlib
# pip install neovim
# pip install numpy
# pip install pandas

# -- Install Gitui
# Download musl.tar.gz file from https://github.com/extrawurst/gitui/releases
# Extract it
# Put it in ~/.local/bin

# -- Install fzf
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install

# =========================== Configurations =========================== #

# -- Configure Docker
# https://docs.docker.com/engine/install/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker "$USER"

# -- Setup ssh keys
# Copy ssh folder if there is a backup
# Make permissions correct
# chmod 700 ~/.ssh
# chmod 600 ~/.ssh/id_rsa
# chmod 644 ~/.ssh/id_rsa.pub
# chmod 644 ~/.ssh/config

# -- Setup Gnome terminal
# Add Gruvbox theme
# Set theme to Gruvbox Dark with gogh:
# https://github.com/Gogh-Co/Gogh
# bash -c "$(wget -qO- https://git.io/vQgMr)"
# Set font to FiraCode Nerd Mono 11

# -- Setup Tilix
# Set theme to Gruvbox Dark with gogh:
# https://github.com/Gogh-Co/Gogh
# bash -c "$(wget -qO- https://git.io/vQgMr)"
# Set font to FiraCode Nerd Font Regular 11

# -- Enable click to minimize
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
# -- Stop showing mounted drives on dock
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
# -- Cycle windows on scroll on dock
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'
# -- Natural scrolling on touchpad
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

# -- Remap caps lock to ctrl, and both shifts to caps lock in gnome tweaks

# -- Disable splash screen on boot
sudo kernelstub --delete-options "quiet systemd.show_status=false splash"
sudo kernelstub --add-options "systemd.show_status=true"

# -- Enable tlp
sudo tlp start
sudo systemctl enable tlp.service

# =========================== Setup teminal enviroment =========================== #

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

# -- Install nvchad for neovim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

# - Install tpm for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# =========================== Setup dotfiles =========================== #

# Download my dot files
mkdir -p "$HOME/git"
DOT_FILES="$HOME/git/dot-files"
git clone git@github.com:caio96/dot-files.git "$DOT_FILES"

rm -f "$HOME"/.aliases
rm -f "$HOME"/.bash_logout
rm -f "$HOME"/.bashrc
rm -f "$HOME"/.condarc
rm -f "$HOME"/.gitconfig
rm -f "$HOME"/.hidden
rm -f "$HOME"/.profile
rm -f "$HOME"/.tigrc
rm -f "$HOME"/.tmux.conf
rm -f "$HOME"/.vimrc
rm -f "$HOME"/.wezterm.lua
rm -f "$HOME"/.zshrc

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

rm -rf "$HOME"/.config/nvim/lua/custom
ln -s "$DOT_FILES"/.config/nvim/lua/custom "$HOME"/.config/nvim/lua/custom

ln -s "$DOT_FILES"/.oh-my-zsh/custom/syntax-highlight.zsh "$ZSH_CUSTOM"/syntax-highlight.zsh

tmux start-server
tmux new-session -d
"$HOME"/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server
ln -s "$DOT_FILES"/.tmux/plugins/tmux/catppuccin-gruvbox.tmuxtheme "$HOME"/.tmux/plugins/tmux/catppuccin-gruvbox.tmuxtheme

# =========================== Bug fixes =========================== #

# -- Fix for jumpy scrolling
# https://extensions.gnome.org/extension/5282/alttab-scroll-workaround/

# -- (may) Fix problems with suspension due to nvidia
# sudo kernelstub --add-options "nouveau.blacklist=1"
# sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
# sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"

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

