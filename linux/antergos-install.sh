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

# Install programs
	trizen -S --needed atom colordiff docker gdb gimp gparted gvim 
	trizen -S --needed intellij-idea-community-edition jdk9-openjdk
	trizen -S --needed libreoffice-fresh neovim parallel python-pip
	trizen -S --needed qbittorrent rsync texlive-lang texlive-most
	trizen -S --needed texstudio tig tmux vlc xclip

# Gnome extensions support
	trizen -S --needed chrome-gnome-shell-git
	# extensions:
	# alternate tab
	# caffeine (enable when fullscreen)
	# dash to dock
	# lock keys
	# suspend button
	# trash
	# user themes

# AUR
	trizen -S --needed android-sdk android-sdk-platform-tools android-studio
	trizen -S --needed google-chrome
	trizen -S --needed pulseaudio-equalizer-ladspa
	trizen -S --needed solaar
	trizen -S --needed spotify
	trizen -S --needed sublime-text-dev
	trizen -S --needed visual-studio-code-bin

# Tilix - terminal
	trizen -S --needed tilix
	# Add shortcut for tilix and tilix --quake
    # Edit tilix settings

# YouCompleteMe - cpp completer
	trizen -S --needed clang
	# install with vim -> ./install.py --clang-completer --system-libclang
	
# Tlp - power manager
	trizen -S --needed tlp tp_smapi
	systemctl enable tlp tlp-sleep	
	systemctl mask systemd-rfkill.service systemd-rfkill.socket

# Powerline
	sudo pip install powerline-status
	trizen -S --needed nerd-fonts-complete # DroidSans

