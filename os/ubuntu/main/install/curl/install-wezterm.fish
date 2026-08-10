#!/usr/bin/env fish

function install-wezterm
    running-message install-wezterm

    if type -q wezterm
        success-message "wezterm already installed"
    else
        information-message "installing wezterm"

        # upstream ships no apt repository and no generic linux tarball, only
        # per-distro debs. 20240203 is the newest tagged release upstream has cut,
        # and the Ubuntu 22.04 deb is the newest build in it.
        set version 20240203-110809-5046fc22
        set url "https://github.com/wezterm/wezterm/releases/download/$version/wezterm-$version.Ubuntu22.04.deb"
        set filename (basename $url)

        curl -LO $url
        sudo dpkg -i $filename
        sudo apt-get install -f -y
        rm $filename
    end
end
