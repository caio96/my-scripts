# update
sudo sudo pacman -Syu

# install trizen
git clone https://aur.archlinux.org/trizen.git
cd trizen
makepkg -si
# change clone dir in ~/.config/trizen/trizen.conf

# arch packages
sudo pacman -S --needed acpi_call #thinkpad
sudo pacman -S --needed avidemux-qt
sudo pacman -S --needed clang
sudo pacman -S --needed colordiff
sudo pacman -S --needed dhclient
sudo pacman -S --needed docker
sudo pacman -S --needed docker-compose
sudo pacman -S --needed docky
sudo pacman -S --needed etcher
sudo pacman -S --needed gdb
sudo pacman -S --needed gimp
sudo pacman -S --needed gparted
sudo pacman -S --needed grub-customizer
sudo pacman -S --needed gvim
sudo pacman -S --needed htop
sudo pacman -S --needed intellij-idea-community-edition
sudo pacman -S --needed jdk-openjdk
sudo pacman -S --needed libreoffice-still
# sudo pacman -S --needed linux-lts
# sudo pacman -S --needed linux-lts-headers
sudo pacman -S --needed neovim
sudo pacman -S --needed pacman-contrib
sudo pacman -S --needed parallel
sudo pacman -S --needed powerline
sudo pacman -S --needed pulseaudio-equalizer-ladspa
sudo pacman -S --needed qbittorrent
sudo pacman -S --needed ranger
sudo pacman -S --needed redshift
sudo pacman -S --needed rsync
sudo pacman -S --needed simplescreenrecorder
sudo pacman -S --needed solaar
sudo pacman -S --needed texlive-lang
sudo pacman -S --needed texlive-most
sudo pacman -S --needed texstudio
sudo pacman -S --needed tig
sudo pacman -S --needed tilix
sudo pacman -S --needed tlp
sudo pacman -S --needed tmux
sudo pacman -S --needed vlc
sudo pacman -S --needed words
sudo pacman -S --needed xclip
sudo pacman -S --needed zsh
sudo pacman -S --needed zsh-completions

# aur packages
#trizen -S --needed android-sdk
#trizen -S --needed android-sdk-platform-tools
#trizen -S --needed android-studio
#trizen -S --needed aosp-devel
trizen -S --needed google-chrome
#trizen -S --needed jdk
trizen -S --needed nerd-fonts-complete
trizen -S --needed spotify
trizen -S --needed sublime-text-dev
trizen -S --needed visual-studio-code-bin

# install anaconda

# panel
# move panel up
# configure whiskers menu positions
# hide window buttons' labels
# hide unwanted notifications
# add battery applet with percentage
# clock custom format: %d %b  %T

# add hdmi scripts
sudo systemctl enable hdmi-sound-toggle
sudo systemctl start hdmi-sound-toggle

# settings -> display -> advanced
# configure new displays when connected

# set keyboard shortcuts
# set windows manager shortcuts

# add marble-mouse config file

# to show kernel logs at boot:
# remove 'quiet' from GRUB_CMDLINE_LINUX_DEFAULT in /etc/default/grub

# TODO
# dns
# add opendns to /etc/resolve.conf

# anaconda
conda update anaconda
conda update conda
conda update --all

# docky
# fix horizontal line:
# window manager tweaks -> compositor ->
# uncheck 'show shadows under dock windows'

# tmux
# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim
# install plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# neovim
# install plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# zsh
# zsh as default shell
chsh -s $(which zsh)
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# install spaceship theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
# install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# bash
# install bash_it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --no-modify-config

# nerd fonts
# DroidSans
# FuraCode

# tilix
# add shortcut for tilix and tilix --quake
# disable alt-<Arrow> shortcut
# edit tilix settings

# youCompleteMe
# install with vim -> ./install.py --clang-completer --system-libclang

# dhclient
# fixes problems with eduroam
# add to: /etc/NetworkManager/conf.d/dhcp-client.conf
# [main]
# dhcp=dhclient

# grub
# change grub's themes
# set default boot option
sudo update-grub
