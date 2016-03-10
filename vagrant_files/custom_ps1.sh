#!/bin/bash

if ! grep 'export PS1' /home/vagrant/.bashrc ; then 
  echo 'export PS1="\[\033[38;5;34m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;1m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\W\\$\[$(tput sgr0)\]"' >> /home/vagrant/.bashrc
fi