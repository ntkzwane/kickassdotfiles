# Kick-Ass Dotfiles 🤘
This is just a bunch of configuration files I use for all my development tools and environment.

Just `ln -s` each configuration file out into its respective folder, or use the `install` script to do this for you.

1. Update the `KICK_ASS_DOTFILES_HOME` variable in the `install` script to point to where you've cloned this repository
2. Install all config files (will overwrite any existing configuration)
```
$ ./install
```
3. Install a specific configuration file
```
$ ./install tool-name
```

# Notes
## atom/config.cson
* make sure to change the path for node in `sass-linter` plugin

