# Update
    sudo pacman -Syu

# Show windowns on grub (dual boot)
    sudo os-prober
    sudo grub-mkconfig -o /boot/grub/grub.cfg

# Switch lightdm by gmd
    sudo pacman -S gdm
    sudo systemctl disable lightdm && sudo systemctl enable gdm

# Add portuguese keyboard and format
    sudo nano /etc/locale.gen
    sudo locale-gen

# Dconf-editor and go to org/gnome/nautilus/preferences and set the default-sort-order to "type".
# Edit energy and privacy options on tweaks
# Switch dock's click behavior to minimize: tweaks -> extensions -> dash to dock
# Add hdmi audio scripts
# Check if /etc/resolve.conf uses opendns
# Remove 'splash' and 'quiet' from GRUB_CMDLINE_LINUX_DEFAULT in /etc/default/grub to show kernel logs at boot

# Install trizen
    sudo pacman -S git
    git clone https://aur.archlinux.org/trizen.git
    cd trizen
    makepkg -si

# Use zsh as default shell
    trizen -S --needed zsh zsh-completions
    chsh -s $(which zsh)
    # install oh-my-zsh

# Arch packages
    trizen -S --needed atom
    trizen -S --needed clang
    trizen -S --needed colordiff
    trizen -S --needed dhclient
    trizen -S --needed docker
    trizen -S --needed docker-compose
    trizen -S --needed etcher
    trizen -S --needed gdb
    trizen -S --needed gimp
    trizen -S --needed gparted
    trizen -S --needed grub-customizer
    trizen -S --needed gvim
    trizen -S --needed htop
    trizen -S --needed intellij-idea-community-edition
    trizen -S --needed jdk9-openjdk
    trizen -S --needed libreoffice-fresh
    trizen -S --needed linux-lts
    trizen -S --needed linux-lts-headers
    trizen -S --needed neovim
    trizen -S --needed pacman-contrib
    trizen -S --needed parallel
    trizen -S --needed pikaur
    trizen -S --needed python-pip
    trizen -S --needed powerline
    trizen -S --needed powerline-fonts
    trizen -S --needed qbittorrent
    trizen -S --needed ranger
    trizen -S --needed redshift
    trizen -S --needed rsync
    trizen -S --needed simplescreenrecorder
    trizen -S --needed solaar
    trizen -S --needed texlive-lang
    trizen -S --needed texlive-most
    trizen -S --needed texstudio
    trizen -S --needed tig
    trizen -S --needed tilix
    trizen -S --needed tlp
    trizen -S --needed tmux
    trizen -S --needed vim
    trizen -S --needed vlc
    trizen -S --needed words
    trizen -S --needed xclip

# AUR
    trizen -S --needed anaconda
    trizen -S --needed android-sdk
    trizen -S --needed android-sdk-platform-tools
    trizen -S --needed android-studio
    trizen -S --needed aosp-devel
    trizen -S --needed chrome-gnome-shell-git
    trizen -S --needed google-chrome
    trizen -S --needed grub2-theme-vimix-git
    trizen -S --needed jdk
    trizen -S --needed nerd-fonts-complete
    trizen -S --needed pulseaudio-equalizer-ladspa
    trizen -S --needed spotify
    trizen -S --needed sublime-text-dev
    trizen -S --needed visual-studio-code-bin

# Chrome Gnome Shell
    # extensions:
    # alternate tab
    # caffeine (enable when fullscreen)
    # dash to dock
    # lock keys
    # suspend button
    # user themes

# Nerd fonts
    # DroidSans
    # FuraCode

# Tilix
    # Add shortcut for tilix and tilix --quake
    # Disable alt-<Arrow> shortcut
    # Edit tilix settings

# YouCompleteMe
    # install with vim -> ./install.py --clang-completer --system-libclang

# Redshift
    systemctl --user enable redshift.service
    systemctl --user start redshift.service

# Tlp
    systemctl enable tlp tlp-sleep
    systemctl mask systemd-rfkill.service systemd-rfkill.socket

# Show lts kernel on grub
    grub-mkconfig -o /boot/grub/grub.cfg

# Dhclient
    # fixes problems with eduroam
    # add to: /etc/NetworkManager/conf.d/dhcp-client.conf
    # [main]
    # dhcp=dhclient

# Anaconda
    # conda update anaconda
    # conda update conda
    # conda update --all

# Grub Customizer
    # change grub's themes
    # set default boot option
