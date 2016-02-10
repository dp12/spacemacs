## Overview
This is a custom spacemacs configuration, optimized for C/C++ development.

## Installation
To install, git clone the repository into your root directory and symlink .spacemacs.

On Windows, with a root directory of "C:\home":

`mklink "C:\home\.spacemacs" "C:\home\spacemacs\.spacemacs"`

On Linux, run the reverse:

`ln -s ~/spacemacs/.spacemacs ~/.spacemacs`

## Layers
### keymap

Adds special keymappings, using key-chord and hydra.

### progconfig

Conveniences for everyday programming. Includes corral for paren/bracket wrapping and mode hooks for specific languages.

### search

Initializes ffip and fiplr (take your pick!) for Cmd-T/Ctrl-P like file search.

### sicp

Includes quack and geiser for doing SICP.

### snippets

Snippets for yasnippet expansion.

### custom

Personal packages and configurations. Comment out in dotspacemacs-configuration-layers if unused.