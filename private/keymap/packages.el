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
      ;; (key-chord-define-global "bj" 'bookmark-jump)
      (key-chord-define-global "qr" 'query-replace)
      (key-chord-define-global "QR" 'vr/query-replace)
      (key-chord-define-global "vv" 'other-window)

      ; Helm
      (key-chord-define-global "jn" 'helm-swoop)
      (key-chord-define-global "HG" 'helm-multi-swoop-all)
      (key-chord-define-global "HB" 'helm-bookmarks)

      ; Tagging
      (key-chord-define-global "qg" 'ggtags-find-tag-dwim)
      (key-chord-define-global "qc" 'ggtags-find-reference)
      (key-chord-define-global "qw" 'pop-tag-mark)
      (key-chord-define-global "QG" 'helm-gtags-dwim)
      (key-chord-define-global "QC" 'helm-gtags-find-rtag)
      (key-chord-define-global "QW" 'helm-gtags-pop-stack)

      ; Spacemacs
      (key-chord-define-global "NC" 'spacemacs/toggle-nyan-cat-progress-bar)

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
        ("v" git-gutter+-revert-hunk "revert")
        ("r" git-gutter+-revert-hunk "revert")
        ("=" git-gutter+-show-hunk "show")
        ("i" git-gutter+-show-hunk-inline-at-point "show inline")
        ("s" git-gutter+-stage-hunks "stage")
        ("c" git-gutter+-stage-and-commit "stage/commit")
        ("C" git-gutter+-stage-and-commit-whole-buffer "stage/commit buffer")
        ("l" recenter-top-bottom "recenter window")
        ("q" nil "quit"))
      (defhydra hydra-hippie-line (global-map "C-x")
        "Expand Line"
        ("l" my-expand-lines "hippie line")
        ("q" evil-escape "quit"))
      (defhydra hydra-kill-buffer (global-map "C-x")
        "Kill Buffer"
        ("k" (lambda () (interactive) (kill-buffer nil)) "assassinate buffer" :color red)
        ("K" kill-buffer "kill buffer")
        ("x" (lambda () (interactive) (kill-buffer nil)) "assassinate buffer" :color blue)
        ("q" nil "quit"))
      (defhydra hydra-org (global-map "C-c o" :color red :columns 3)
        "Org Mode Movements"
        ("n" outline-next-visible-heading "next heading")
        ("p" outline-previous-visible-heading "prev heading")
        ("N" org-forward-heading-same-level "next heading at same level")
        ("P" org-backward-heading-same-level "prev heading at same level")
        ("u" outline-up-heading "up heading")
        ("g" org-goto "goto" :exit t))
      (defhydra hydra-sp (global-map "C-c x")
        "Smartparens"
        ("a" sp-absorb-sexp "absorb")
        ("b" sp-forward-barf-sexp "barf fwd")
        ("B" sp-backward-barf-sexp "barf bwd")
        ("k" sp-splice-sexp-killing-forward "splice killing fwd")
        ("K" sp-splice-sexp-killing-backward "splice killing bwd")
        ("r" sp-splice-sexp-killing-around "splice killing around")
        ("s" sp-forward-slurp-sexp "slurp fwd")
        ("S" sp-backward-slurp-sexp "slurp bwd")
        ("t" sp-transpose-sexp "transpose")
        ("w" sp-wrap-sexp "wrap")
        ("W" sp-unwrap-sexp "unwrap"))
      (defhydra hydra-corral (:columns 6)
        "Corral"
        ("(" corral-parentheses-backward "Back")
        (")" corral-parentheses-forward "Forward")
        ("[" corral-brackets-backward "Back")
        ("]" corral-brackets-forward "Forward")
        ("{" corral-braces-backward "Back")
        ("}" corral-braces-forward "Forward")
        (";" corral-single-quotes-backward "' Backward")
        ("'" corral-single-quotes-forward "Forward")
        (":" corral-double-quotes-backward "\" Backward")
        ("\"" corral-double-quotes-forward "Forward")
        ("." hydra-repeat "Repeat"))
      (global-set-key (kbd "C-c c") #'hydra-corral/body)
      )
    ))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
