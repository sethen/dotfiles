#!/bin/zsh

if type uname > /dev/null; then
    if [[ -n `uname -a | grep 'Ubuntu'` ]]; then
	export DISTRO='ubuntu'
    else
	echo 'operating system not recognized'

	sleep 3
	exit 1
    fi
else
    echo 'operating system could not be determined'
fi
