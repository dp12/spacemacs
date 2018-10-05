## Table of Contents
* [Overview](https://github.com/dp12/spacemacs#overview)
* [Installation](https://github.com/dp12/spacemacs#installation)
* [Custom Keybindings](https://github.com/dp12/spacemacs#custom-keybindings)
* [Emacs-style Keybindings](https://github.com/dp12/spacemacs#emacs-style-keybindings)
* [Evil-style Keybindings](https://github.com/dp12/spacemacs#evil-style-keybindings)
* [Layers](https://github.com/dp12/spacemacs#layers)

## Overview
This is a custom spacemacs configuration, optimized for C/C++ development.

## Installation
To install, git clone the repository:

`git clone https://github.com/dp12/spacemacs.git ~/.spacemacs.d`

## Layers

Name             | Description
-----------------|------------------------------------------------------------
**keymap**       | Adds special keymappings, using key-chord and hydra.
**progconfig**   | Configurations for programming modes and related packages.
**mail**         | Setup for using mu4e as a mail client in emacs.
**search**       | Initializes packages for search and navigation, e.g. dumb-jump, treemacs, and dired.
**text-editing** | Useful snippets and packages for text manipulation.
**custom**       | Personal packages and configurations. Comment out in dotspacemacs-configuration-layers if unused.

## Custom Keybindings
This is a non-comprehensive list of some useful keybindings in this spacemacs configuration.

### Spacemacs Cheatsheet
The following are some of my favorite built-in spacemacs commands:

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>SPC a u</kbd>   | Open undo-tree visualizer.
<kbd>SPC c h</kbd>   | Toggle hiding all comments.
<kbd>SPC f E</kbd>   | Edit file as sudo.
<kbd>SPC g h t</kbd> | Launch smeargle (shows newer hunks with lighter background).
<kbd>SPC g s</kbd>   | Launch magit (emacs git interface).
<kbd>SPC h k</kbd>   | Show the high-level keymap.
<kbd>SPC k s</kbd>   | Slurp forward.
<kbd>SPC t -</kbd>   | Toggle centered point.
<kbd>SPC t d</kbd>   | Toggle hungry delete.
<kbd>SPC t f</kbd>   | Show fill column.
<kbd>SPC t n</kbd>   | Toggle line numbers.
<kbd>SPC t r</kbd>   | Toggle relative line numbers.
<kbd>SPC t w</kbd>   | Toggle whitespace mode.
<kbd>SPC x a c</kbd> | Align the current region.
<kbd>SPC x d w</kbd> | Delete trailing whitespace.
<kbd>SPC x l s</kbd> | Sort lines.
<kbd>vio</kbd>       | Select current symbol (Spacemacs special text object).

### Emacs-style Keybindings
Custom keybindings, vanilla emacs-style:

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>vv</kbd>      | other-window. Key-chord for switching to the other window; a much faster and ergonomic way of doing `C-x o`.
<kbd>qr</kbd>      | query-replace. Lets you enter a string and the string to replace it with. Press `y` to do replace on the current selection and go to next instance, `n` to skip replacing and go to next instance, and `,` to replace, but stay at the current location.
<kbd>M-;</kbd>     | comment-or-uncomment-region-or-line. A saner way of commenting code in emacs.
<kbd>M-.</kbd>     | ggtags-find-tag-dwim. If the cursor is over a function call, jump to its definition. Pop back to your original cursor location with `M-*` (it's a stack, so you can pop out repeatedly). If the cursor is over a function definition, it finds the first reference (place where function is used). Use `M-n` and `M-p` to navigate between multiple references. Requires GNU Global to be installed.
<kbd>qw</kbd>      | pop-tag-mark. Key-chord to pop a tag from the taglist after doing a find-tag invocation to jump back to the previous location.
<kbd>M-z</kbd>     | zop-to-char. Kills text up to a character of your choice.
<kbd>M-n</kbd>     | dired-narrow. Allows you to type in a pattern to filter out dired results. Press `g` to revert-buffer and restore the original dired listing.
<kbd>a</kbd>       | ag. In a dired buffer, press this key to ag search recursively in all files under that directory.
<kbd>W</kbd>       | wdired-change-to-wdired-mode. Use this to treat your filesystem like ordinary text and rename files in dired!
<kbd>C-c g</kbd>   | counsel-git. Fast fuzzy file finder like Vim's ctrl-p or Sublime Text's Cmd-T.
<kbd>C-x f</kbd>   | recentf-open-files. Lists your most recent files opened. Press a number from 0-9 to open the file you want.
<kbd>C-c n</kbd>   | hydra-git-gutter+. Go to the next git-gutter+ hunk. Very useful for viewing and staging your unstaged changes in a file. Use `i` to show hunks inline, `s` to stage hunks, and `v` to revert hunks.
<kbd>M-0</kbd>     | corral-parentheses-forward. Wrap whatever symbol your cursor is on in parentheses. To "wrap-at-point" from your cursor position to the end of the word, use `C-M-0`.

### Evil-style Keybindings
Custom keybindings for evil:

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>n</kbd>       | [avy](https://github.com/abo-abo/avy). With avy, press any character that you want your cursor jump to on the screen and then press the corresponding character that shows up. Once activated, lets you jump anywhere on your screen in usually two keystrokes.
<kbd>s</kbd>       | evil-snipe-s. Lets you jump to any location, as selected by two consecutive characters. Keep pressing `s` to get to the next match.
<kbd>SPC b x</kbd> | ace-swap-window. If you have two buffers, use this to exchange their positions.
<kbd>SPC d o</kbd> | dired-jump-other-window. Opens up dired for the current directory in another window. Pro tip: if you want to open up the same file in the other window, just do `SPC d o RET`.
<kbd>SPC D D</kbd> | kill-dired-buffers. Custom function to kill all dired buffers.
<kbd>SPC e d</kbd> | ediff-buffers. With two buffers open, you can diff them easily with this command.
<kbd>SPC b k</kbd> | hydra-buffer-kill. Launch a special hydra for killing buffers quickly.
