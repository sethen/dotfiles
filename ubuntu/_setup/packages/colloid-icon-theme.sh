#!/bin/zsh

if [[ -z $(dconf read /org/gnome/desktop/interface/icon-theme | grep "'Colloid-dark'") ]]; then
    information-message 'colloid icons not installed'
else
    success-message 'colloid icons installed'
fi
