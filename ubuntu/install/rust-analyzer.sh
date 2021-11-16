#!/bin/zsh

RUST_ANALYZER_LOCAL_BIN=~/.local/bin/rust-analyzer

if [[ ! -a $RUST_ANALYZER_LOCAL_BIN ]]; then
	information_message 'installing rust-analyzer'

	FILENAME=rust-analyzer-x86_64-unknown-linux-gnu
	FILENAME_GZ=$FILENAME.gz

	curl -LO https://github.com/rust-analyzer/rust-analyzer/releases/download/$RUST_ANALYZER_VERSION/rust-analyzer-x86_64-unknown-linux-gnu.gz

	gunzip $PRESENT_WORKING_DIRECTORY/$FILENAME_GZ
	sudo cp $FILENAME $RUST_ANALYZER_LOCAL_BIN && rm -rf $PRESENT_WORKING_DIRECTORY/$FILENAME*
else
	success_message 'rust-analyzer already installed'
fi
