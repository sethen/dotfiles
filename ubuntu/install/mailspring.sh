#!/bin/zsh

export MAILSPRING=$USR_SHARE_APPLICATIONS/mailspring.desktop

if [[ ! -a $MAILSPRING ]]; then
	information_message "installing mailspring"

	DEB_FILE=mailspring.deb
	URL="https://updates.getmailspring.com/download?platform=linuxDeb"

	wget -O $DEB_FILE $URL
	sudo dpkg -i $DEB_FILE
	rm -rf $DEB_FILE
else
	success_message "mailspring is already installed"
fi
