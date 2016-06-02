## Table of Contents
* [Overview](#wiki-Overview)
* [Installation](#wiki-Installation)
* [Custom Keybindings](#wiki-Custom Keybindings)
* [Emacs-style Keybindings](#wiki-Emacs-style Keybindings)
* [Evil-style Keybindings](#wiki-Evil-style Keybindings)
* [Layers](#wiki-Layers)

## <a name="Overview"/> Overview
This is a custom spacemacs configuration, optimized for C/C++ development. Features company-irony for completion and various hydra conveniences.

## <a name="Installation"/> Installation
To install, git clone the repository into your root directory and symlink the .spacemacs file and the yasnippets folder.

On Windows, with a root directory of "C:\home":

`mklink "C:\home\.spacemacs" "C:\home\spacemacs\.spacemacs"`

`mklink /j "C:\home\.emacs.d\private\snippets" "C:\home\spacemacs\private\snippets\"`

On Linux, run the reverse:

`ln -s ~/spacemacs/.spacemacs ~/.spacemacs`

`ln -s ~/spacemacs/private/snippets ~/.emacs.d/private/snippets`

## <a name="Custom Keybindings"/> Custom Keybindings
### <a name="Emacs-style Keybindings"/> Emacs-style Keybindings
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
<kbd>C-x f</kbd>   | recentf-open-files. Lists your most recent files opened. Press a number from 0-9 to open the file you want.
<kbd>C-c n</kbd>   | hydra-git-gutter+. Go to the next git-gutter+ hunk. Very useful for viewing and staging your unstaged changes in a file. Use `i` to show hunks inline, `s` to stage hunks, and `v` to revert hunks.
<kbd>M-0</kbd>     | corral-parentheses-forward. Wrap whatever symbol your cursor is on in parentheses. To "wrap-at-point" from your cursor position to the end of the word, use `C-M-0`.

### <a name="Evil-style Keybindings"/> Evil-style Keybindings
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>n</kbd>       | [avy](https://github.com/abo-abo/avy). With avy, press any character that you want your cursor jump to on the screen and then press the corresponding character that shows up. Once activated, lets you jump anywhere on your screen in usually two keystrokes.
<kbd>s</kbd>       | evil-snipe-s. Lets you jump to any location, as selected by two consecutive characters. Keep pressing `s` to get to the next match.
<kbd>SPC f i</kbd> | find-file-in-project. Fuzzy file finder like Vim's ctrl-p or Sublime Text's Cmd-T.
<kbd>SPC b x</kbd> | ace-swap-window. If you have two buffers, use this to exchange their positions.
<kbd>SPC d o</kbd> | dired-jump-other-window. Opens up dired for the current directory in another window. Pro tip: if you want to open up the same file in the other window, just do `SPC d o RET`.
<kbd>SPC D D</kbd> | kill-dired-buffers. Custom function to kill all dired buffers.
<kbd>SPC e d</kbd> | ediff-buffers. With two buffers open, you can diff them easily with this command.
<kbd>SPC W</kbd>   | spacemacs/workspaces-micro-state. Use this to access the eyebrowse microstate, an i3-like way of managing windows. Easier than `SPC l w`!
<kbd>SPC b k</kbd> | hydra-buffer-kill. Launch a special hydra for killing buffers quickly.


## <a name="Layers"/> Layers
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