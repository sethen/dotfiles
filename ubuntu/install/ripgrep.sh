#!/bin/zsh

if [[ ! -a /usr/bin/rg ]]; then
	information_message "installing ripgrep"

	RIPGREP=ripgrep_0.10.0-*
	URL="https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz"

	curl -LO $URL
	tar xf ${RIPGREP}.tar.gz
	sudo cp ${RIPGREP}/rg /usr/bin/rg
	rm -rf ${RIPGREP}
else
	success_message "ripgrep already installed"
fi
