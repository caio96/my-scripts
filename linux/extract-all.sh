#!/bin/bash

if [ -f "$1" ] ; then
  case $1 in
    *.tar.bz2)  tar xjf $1   ;;
    *.tar.gz)   tar xzf $1   ;;
    *.tar.xz)   tar zxvf $1  ;;
    *.bz2)      bunzip2 $1   ;;
    *.rar)      rar x $1     ;;
    *.gz)       gunzip $1    ;;
    *.tar)      tar xf $1    ;;
    *.tbz2)     tar xjf $1   ;;
    *.tgz)      tar xzf $1   ;;
    *.xz)       xz -d $1     ;;
    *.zip)      unzip $1     ;;
    *.Z)        uncompress $1;;
    *)          echo "contents of '$1' cannot be extracted" ;;
  esac
else
  echo "'$1' is not recognized as a compressed file"
fi
