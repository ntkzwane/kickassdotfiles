# Kick-Ass Dotfiles 🤘
## What is this?
This is a bunch of configuration files I use for my development environment and tools.

## How to use them
`ln -s` each configuration file out into its respective folder, or use the `install` script to do this for you:

1. Update the `KICK_ASS_DOTFILES_HOME` variable in the `install` script and point to where you've cloned this repository i.e (`pwd` in this folder).
2. Install all config files (will overwrite any existing configuration).
```
$ ./install
```
3. Install a configuration file for a specific tool
```
$ ./install tool-name
```

# Notes
## Supported tools
* fzf
* vim
* oh-my-zsh
* i3wm
* swaywm
* git
* DiffSoFancy
* VS Code
* compton
* ubuntu profile

## Post-install things
### atom/config.cson
* make sure to change the path for node in `sass-linter` plugin

