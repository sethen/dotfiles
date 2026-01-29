#!/usr/bin/env fish

function install-ffmpeg
  running-message "install-ffmpeg"

  yay-install-package ffmpeg
end
