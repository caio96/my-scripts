# Alias definitions

alias ll='ls -AlFh'
alias la='ls -A'
alias l='ls -CF'
alias python='python3'
alias ipython='ipython3'
alias ischeme='jupyter console --kernel calysto_scheme'
alias diff='colordiff'
alias n='nautilus .'
alias tkillmux='tmux kill-session -t 0'
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias caio-update="sudo apt-get update && sudo apt-get -y upgrade"
alias caio-refresh="sudo apt-get -y autoremove && sudo apt-get -y autoclean && sudo apt-get -y clean"
# Add an "alert" alias for long running commands.  Use like so: "sleep 10; alert"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias network-restart="service network-manager restart"
alias touchpad-restart="sudo modprobe -r psmouse && sudo modprobe psmouse"
