#!/bin/zsh

read "REBOOT?would you like to reboot the system? [Yy/Nn] "

if [[ $REBOOT =~ '[Yy]' ]]; then
    echo "\nrebooting ..."

    sleep 5
    reboot
fi
