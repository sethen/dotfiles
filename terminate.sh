#!/bin/zsh

read "REBOOT?would you like to reboot the system? [Y/N] "

if [[ $REBOOT =~ '[Yy]' ]]; then
    success_message "Rebooting..."

    sleep 5
    reboot
fi