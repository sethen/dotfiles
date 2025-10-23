These are my dotfiles for setting up my environment from nothing. Take and use anything you want.

# Intro

These dotfiles are a bit different in that they use something I call a `dot-launcher`.  This is a fish script that runs other fish scripts.  The main script is `run.fish`.  Each script is called a `dot-function` and they are located in the `.config/fish/functions/dot` directory.  Each dot-function does one thing, like install neovim or set up git.  You can run them every doc-function individually or run them all with the `run-all` dot-function.

## Ghostty with Starship & Fish
![image](assets/images/terminal.png)

## Dot Launcher
A custom launcher for all of your dotfiles.  Run them all or one at a time.

![image](assets/images/dot-launcher.png)

## Neovim
![image](assets/images/neovim.png)

# Quickstart

1. Install `fish` in your terminal by using `sudo apt install fish`
2. Modify the `.gitconfig` file in the `os` directory to have your name and email
3. Execute the `run.fish` file while in `fish`
4. Pick the `run-all` dot function

# Environments

* Ubuntu 25.04 (older versions not tested or supported)
