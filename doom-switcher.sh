#!/usr/bin/env bash
if [[ -d ~/.emacs.d.spacemacs ]]; then
    echo "Switch to spacemacs"
    pkill emacs
    pkill emacs
    mv ~/.emacs.d ~/.emacs.d.doom
    mv ~/.emacs.d.spacemacs ~/.emacs.d
    bspc rule -a Emacs desktop=^1 state=tiled -o; nohup emacs >/dev/null 2>&1 &
elif [[ -d ~/.emacs.d.doom || -f ~/.emacs.d/spacemacs.mk ]]; then
    echo "Switch to doom"
    pkill emacs
    pkill emacs
    mv ~/.emacs.d ~/.emacs.d.spacemacs
    mv ~/.emacs.d.doom ~/.emacs.d
    bspc rule -a Emacs desktop=^1 state=tiled -o; nohup emacs >/dev/null 2>&1 &
else
    echo "No cached spacemacs or doom configurations exist"
fi
