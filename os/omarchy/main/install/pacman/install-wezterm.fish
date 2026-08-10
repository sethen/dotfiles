#!/usr/bin/env fish

function install-wezterm
    running-message install-wezterm

    # not a mise tool: mise has no wezterm registry entry, and the ubi/github
    # backends cannot install it either, because upstream publishes only per-distro
    # debs, rpms and an AppImage, with no generic linux tarball to unpack. a real
    # package also brings the terminfo, the icon and wezterm-mux-server, all of
    # which this setup depends on.
    #
    # deliberately not extra/wezterm. that package is pinned to 20240203, upstream's
    # last tagged release, and its wayland backend never commits a buffer under
    # hyprland 0.56: the process starts, opengl initialises, the shell spawns and
    # renders, but the surface is never mapped, so `hyprctl clients` lists nothing
    # and the terminal simply never appears. reproduced with `wezterm-gui -n`, so it
    # is the binary and not wezterm/wezterm.lua. enable_wayland=false and
    # front_end="WebGpu" do not work around it.
    #
    # wezterm-nightly-bin is the prebuilt upstream nightly. it provides/conflicts
    # wezterm, so if extra/wezterm is ever present this install aborts: pacman
    # raises the conflict as a y/N prompt that defaults to no, and --noconfirm takes
    # that default. `sudo pacman -R wezterm` first and re-run. nothing depends on it,
    # and ttf-jetbrains-mono is installed explicitly by install-ttf-jetbrains-mono,
    # so plain -R leaves the font this setup needs in place.
    yay-install-package wezterm-nightly-bin
end
