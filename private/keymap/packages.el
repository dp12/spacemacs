;;; packages.el --- keymap Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar keymap-packages
  '(
    ;; package keymaps go here
    key-chord
    hydra
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar keymap-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function keymap/init-<package-keymap>
;;
(defun keymap/init-key-chord ()
  "Initialize key-chord"
(use-package key-chord
    :init
    (progn
      (key-chord-mode 1)

      ; Common
      (key-chord-define-global "bj" 'bookmark-jump)
      (key-chord-define-global "qr" 'query-replace)
      (key-chord-define-global "QR" 'query-replace-regexp)
      (key-chord-define-global "VV" 'other-window)
      (key-chord-define-global "vv" 'other-window)

      ; Helm
      (key-chord-define-global "HG" 'helm-multi-swoop-all)
      (key-chord-define-global "HB" 'helm-bookmarks)

      ; Tagging
      (key-chord-define-global "qg" 'ggtags-find-tag-dwim)
      (key-chord-define-global "qc" 'ggtags-find-reference)
      (key-chord-define-global "qw" 'pop-tag-mark)
      (key-chord-define-global "QG" 'helm-gtags-dwim)
      (key-chord-define-global "QC" 'helm-gtags-find-rtag)
      (key-chord-define-global "QW" 'helm-gtags-pop-stack)
      ; Special
      (key-chord-define-global "TP" 'org-toggle-pretty-entities)
      (key-chord-define-global "WM" 'whitespace-mode)
      (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
      )
    ))


(defun keymap/init-hydra ()
  "Initialize hydra"
  (use-package hydra
    :init
    (progn
      (defhydra hydra-git-gutter+ (global-map "C-c")
        "git-gutter+"
        ("n" git-gutter+-next-hunk "next")
        ("p" git-gutter+-previous-hunk "prev")
        ("V" git-gutter+-revert-hunk "revert")
        ("r" git-gutter+-revert-hunk "revert")
        ("=" git-gutter+-show-hunk "show")
        ("+" git-gutter+-show-hunk-inline-at-point "show inline")
        ("s" git-gutter+-stage-hunks "stage")
        ("c" git-gutter+-stage-and-commit "stage/commit")
        ("C" git-gutter+-stage-and-commit-whole-buffer "stage/commit buffer")
        ("l" recenter-top-bottom "recenter window")
        ("q" nil "quit"))
      (defhydra hydra-hippie-line (global-map "C-x")
        "Expand Line"
        ("l" my-expand-lines "hippie line")
        ("q" nil "quit"))
      )
    ))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
