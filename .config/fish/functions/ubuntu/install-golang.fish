#!/bin/fish

function install-golang
  running-message "install-golang"

  if type go >/dev/null
    success-message "golang already installed"
  else
    set GOLANG "https://go.dev/dl/go$GO_VERSION.linux-386.tar.gz"

    curl -LO $GOLANG
    sudo tar -C /usr/local -xzf "go$GO_VERSION.linux-386.tar.gz"
    rm "go$GO_VERSION.linux-386.tar.gz"

    set -U fish_user_paths /usr/local/go/bin $fish_user_paths
  end
end
