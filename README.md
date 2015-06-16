## Overview
This is a custom spacemacs configuration, optimized for C/C++ development.

## Installation 
To install, git clone the repository into your root directory and symlink .spacemacs and the private folder. 

On Windows, with a root directory of "C:\home":

`mklink "C:\home\.spacemacs" "C:\home\spacemacs\.spacemacs"`

`mklink /j "C:\home\.emacs.d\private" "C:\home\spacemacs\private\"`

On Linux, run the reverse: 

`ln -s ~/spacemacs/.spacemacs ~/.spacemacs`

`ln -s ~/spacemacs/private ~/.emacs.d/private`

## Layers 
### ggtags

Initializes ggtags for exploring source code. Use `M-.` to run ggtags-find-tag-dwim and find definition/references.

### keymap

Adds special keymappings, using key-chord and hydra.

### progconfig

Conveniences for everyday programming. Includes corral for paren/bracket wrapping, ws-butler for auto-deletion of whitespace, and dtrt-indent to auto-detect indentation settings.

### search

Initializes fiplr for Cmd-T/Ctrl-P like file search.

### sicp

Includes quack and geiser for doing SICP.

### snippets

Snippets for yasnippet expansion.

### custom    

Personal packages and configurations. Comment out in dotspacemacs-configuration-layers if unused.