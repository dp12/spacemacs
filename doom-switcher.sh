#!/usr/bin/env bash
if [[ -d ~/.emacs.d.spacemacs ]]; then
    echo "Switch to spacemacs"
    pkill emacs
    pkill emacs
    mv ~/.emacs.d ~/.emacs.d.doom
    mv ~/.emacs.d.spacemacs ~/.emacs.d
elif [[ -d ~/.emacs.d.doom || -f ~/.emacs.d/spacemacs.mk ]]; then
    echo "Switch to doom"
    pkill emacs
    pkill emacs
    mv ~/.emacs.d ~/.emacs.d.spacemacs
    mv ~/.emacs.d.doom ~/.emacs.d
else
    echo "No cached spacemacs or doom configurations exist"
fi
