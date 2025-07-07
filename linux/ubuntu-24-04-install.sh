#!/bin/bash
# Setup Ubuntu 24.04

## Update ====================================================== #

sudo apt update && sudo apt -y upgrade

## Install stuff =============================================== #

# Install apt packages
sudo apt install -y atool \
                    baobab \
                    bat \
                    build-essential \
                    ca-certificates \
                    calibre \
                    clang-19 \
                    cmake \
                    curl \
                    eza \
                    fd-find \
                    foot \
                    gdb \
                    gimp \
                    git \
                    git-lfs \
                    gnome-browser-connector \
                    gnome-tweaks \
                    gparted \
                    htop \
                    libreoffice \
                    linux-tools-common \
                    linux-tools-generic \
                    lld-19 \
                    locate \
                    neofetch \
                    ninja-build \
                    pdfgrep \
                    pdftk-java \
                    powertop \
                    python3 \
                    ripgrep \
                    rsync \
                    simple-scan \
                    texlive \
                    texlive-full \
                    tig \
                    tilix \
                    tlp \
                    tmux \
                    tree \
                    ubuntu-restricted-extras \
                    vim \
                    vlc \
                    xclip \
                    zoxide \
                    zsh

# -- Install Chrome
# https://www.google.com/chrome/
curl -L "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -o ~/Downloads/chrome.deb
sudo apt install ~/Downloads/chrome.deb

# -- Install Discord
# https://discord.com/download
curl -L "https://discord.com/api/download?platform=linux" -o ~/Downloads/discord.deb
sudo apt install ~/Downloads/discord.deb

# -- Install Docker
# https://docs.docker.com/engine/install/ubuntu/
# Add Docker's official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# -- Install fzf
# https://github.com/junegunn/fzf.git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# -- Install Gitui
# https://github.com/gitui-org/gitui
curl -L "https://github.com/gitui-org/gitui/releases/latest/download/gitui-linux-x86_64.tar.gz" -o ~/Downloads/gitui.tar.gz
atool ~/Downloads/gitui.tar.gz --extract-to ~/.local/bin
chmod +x ~/.local/bin/gitui

# -- Install Miniconda
# https://docs.conda.io/en/latest/miniconda.html
mkdir -p ~/.anaconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/.anaconda3/miniconda.sh
bash ~/.anaconda3/miniconda.sh -b -u -p ~/.anaconda3
rm ~/.anaconda3/miniconda.sh
# Update conda
~/.anaconda3/bin/conda update conda
~/.anaconda3/bin/conda update --all
# Install pip packages
/home/caio/.anaconda3/bin/pip install ipython
/home/caio/.anaconda3/bin/pip install neovim
/home/caio/.anaconda3/bin/pip install pygments
/home/caio/.anaconda3/bin/pip install tldr

# -- Install Neovim
# https://github.com/neovim/neovim/releases/latest
mkdir -p ~/.local/bin
curl -L "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage" -o ~/.local/bin/nvim
chmod u+x ~/.local/bin/nvim

# -- Install Nerdfonts
# https://www.nerdfonts.com/font-downloads
curl -L "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip" -o ~/Downloads/FiraCode.zip
mkdir ~/.fonts
atool FiraCode.zip --extract-to ~/.fonts
rm ~/Downloads/FiraCode.zip
fc-cache -fv

# -- Install Node with fnm (a lot faster than nvm)
# https://nodejs.org/en/download
curl -o- https://fnm.vercel.app/install | bash
source "$HOME/.zshrc"
fnm install 22

# -- Install Papirus Icon Theme
# https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
sudo add-apt-repository ppa:papirus/papirus
sudo apt update && sudo apt install papirus-icon-theme papirus-folders

# -- Install Spotify
# https://www.spotify.com/ca-en/download/linux/
curl -sS "https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg" | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client

# -- Install VSCode
# https://code.visualstudio.com/download
curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o ~/Downloads/code.deb
sudo apt install ~/Downloads/code.deb

# -- Install Wezterm
# https://wezterm.org/install/linux.html
curl -fsSL "https://apt.fury.io/wez/gpg.key" | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
sudo apt update && sudo apt install wezterm

# -- Install Zoom
# Zoom: https://zoom.us/download
# sudo apt install ./file.deb

# -- Install Zotero
# https://www.zotero.org/download/
curl -L "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64" -o ~/Downloads/zotero.tar.bz2
mkdir ~/Downloads/zotero
atool ~/Downloads/zotero.tar.bz2 --extract-to ~/Downloads/zotero
rm ~/Downloads/zotero.tar.bz2
sudo mv ~/Downloads/zotero /opt/
/opt/zotero/set_launcher_icon
ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop

## Configure =================================================== #

# -- Configure Icons
# change theme in gnome-tweaks
# change color of folder
papirus-folders -C yaru --theme Papirus-Dark

# -- Configure cursor
# https://www.gnome-look.org/p/1457884
# add cursor theme to ~/.icons
# set cursor theme in gnome-tweaks
# set the same cursor theme in /usr/share/icons/default/index.theme

# -- Disable Ubuntu pro messages when updating
# Comment all lines in /var/lib/ubuntu-advantage/apt-esm/etc/apt/sources.list.d/ubuntu-esm-apps.sources

# -- Configure Chrome
# go to chrome://flags/ and disable Hardware Media Key Handling

# -- Configure Discord
# add "discord --start-minimized" to startup applications

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
bash -c "$(wget -qO- https://git.io/vQgMr)"
# If this fails, create a new profile first and then try again
# Set font to FiraCode Nerd Font

# -- Setup Tilix
# Set theme to Gruvbox Dark with gogh:
# https://github.com/Gogh-Co/Gogh
bash -c "$(wget -qO- https://git.io/vQgMr)"
# Set font to FiraCode Nerd Font Regular
# Set to run as login shell
# Disable terminal title in single terminal

# -- Configure Ubuntu behaviour
# Enable click to minimize
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
# Cycle windows on scroll on dock
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'cycle-windows'

# -- Remap caps lock to ctrl, and both shifts to caps lock in gnome tweaks
# Go to gnome-tweaks -> Keyboard & Mouse -> Additional layout options

# -- Enable tlp
sudo tlp start
sudo systemctl enable tlp.service

# -- Configure grub
# Remove quiet and splash from /etc/default/grub
sudo update-grub

# -- Make Dash nice
# Install Gnome extensions
#   - Blur my shell
#   - Open Bar
#   - Tiling Shell
#   - Dash to Dock
#   - User Themes
#   - Alphabetical App Grid
# Enable dash to dock with gnome shell extensions
# Disable ubuntu-dock
sudo mv /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com.bak
# Enable blur my shell only for the overview
# Import open bar configuration and update background pallete

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
git clone git@github.com:caio96/dot-files.git "$HOME/git/dot-files"

mv "$HOME"/.bashrc "$HOME"/.bashrc.bak 
mv "$HOME"/.profile "$HOME"/.profile.bak
mv "$HOME"/.zshrc "$HOME"/.zshrc.bak

DOT_FILES="$HOME/git/dot-files"
if [[ -d "$DOT_FILES" && -n "$DOT_FILES" ]]; then
  ln -s "$DOT_FILES"/.aliases "$HOME"/.aliases
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

  mkdir -p "$HOME"/.config/Code/User
  ln -s "$DOT_FILES"/.config/Code/User/settings.json "$HOME"/.config/Code/User/settings.json
  mkdir -p "$HOME"/.config/foot
  ln -s "$DOT_FILES"/.config/foot/foot.ini "$HOME"/.config/foot/foot.ini
  ln -s "$DOT_FILES"/.config/nvim ~/.config/nvim
  ln -s "$DOT_FILES"/.config/spaceship.zsh "$HOME"/.config/spaceship.zsh
  ln -s "$DOT_FILES"/.config/starship.toml "$HOME"/.config/starship.toml

  ln -s "$DOT_FILES"/.oh-my-zsh/custom/syntax-highlight.zsh "$ZSH_CUSTOM"/syntax-highlight.zsh

  tmux start-server
  tmux new-session -d
  "$HOME"/.tmux/plugins/tpm/scripts/install_plugins.sh
  tmux kill-server
  ln -s "$DOT_FILES"/.tmux/plugins/tmux/themes/catppuccin_gruvbox.tmuxtheme "$HOME"/.tmux/plugins/tmux/themes/catppuccin_gruvbox.tmuxtheme
fi

# =========================== Bug fixes =========================== #

# -- Stop messing with the time in Windows (in dual boot)
# timedatectl set-local-rtc 1

# -- Use Zsh as default if user is not in /etc/passwd
# Add to .bash_profile
# if [ "$SHELL" != "/usr/bin/zsh" ]; then
#     export SHELL="/usr/bin/zsh"
#     exec /usr/bin/zsh -l
# fi

# =========================== Clean up =========================== #

sudo apt -y autoremove && sudo apt -y clean

# =========================== Optional software =========================== #

# https://dystroy.org/broot/
# https://github.com/cyrus-and/gdb-dashboard
# https://github.com/akavel/up
# https://github.com/denisidoro/navi
# https://github.com/neovide/neovide
# https://github.com/sindresorhus/fkill
# https://obsproject.com/wiki/install-instructions#linux
# https://youtube-dl.org/
# https://www.willus.com/k2pdfopt/
# https://www.darktable.org/
