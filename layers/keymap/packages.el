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
      (key-chord-define-global "HB" 'helm-bookmarks)

      ; Tagging
      (key-chord-define-global "qg" 'ggtags-find-tag-dwim)
      (key-chord-define-global "qc" 'ggtags-find-reference)
      (key-chord-define-global "qw" 'pop-tag-mark)
      (key-chord-define-global "qf" 'source-peek)
      (key-chord-define-global "QG" 'helm-gtags-dwim)
      (key-chord-define-global "QC" 'helm-gtags-find-rtag)
      (key-chord-define-global "QW" 'helm-gtags-pop-stack)

      ; Spacemacs
      (key-chord-define-global "NC" 'spacemacs/toggle-nyan-cat-progress-bar)

      ; Special
      (key-chord-define-global "TP" 'org-toggle-pretty-entities)
      (key-chord-define evil-insert-state-map "kj" 'evil-normal-state))
    :config
    ;; Org-mode keybindings
    (with-eval-after-load 'org-mode
      (key-chord-define org-mode-map "qg" 'flyspell-buffer)
      (key-chord-define org-mode-map "qc" 'flyspell-correct-wrapper))))

(with-eval-after-load 'hydra
  (defhydra hydra-git-gutter+ (global-map "C-c")
    "git-gutter+"
    ("n" git-gutter+-next-hunk "next")
    ("p" git-gutter+-previous-hunk "prev")
    ("v" git-gutter+-revert-hunk "revert")
    ("r" git-gutter+-revert-hunk "revert")
    ("=" git-gutter+-show-hunk "show")
    ("i" git-gutter+-show-hunk-inline-at-point "show inline")
    ("m" git-messenger:popup-message "msgr")
    ("s" git-gutter+-stage-hunks "stage")
    ("S" magit-status "magit")
    ("c" git-gutter+-stage-and-commit "stage/commit" :color blue)
    ("C" git-gutter+-stage-and-commit-whole-buffer "stage/commit buffer" :color blue)
    ("l" recenter-top-bottom "recenter window")
    ("q" nil "quit"))
  ;; (defhydra hydra-hippie-line (global-map "C-x")
  ;;   "Expand Line"
  ;;   ("l" my-expand-lines "hippie line")
  ;;   ("q" evil-escape "quit" :exit t)
  ;;   ("RET" evil-escape "quit" :exit t))
  (defhydra hydra-rotate ()
    "Rotate text"
    ("r" rotate-word-at-point "rotate")
    ("q" nil "quit")
    ("RET" nil "quit"))
  (defhydra hydra-kill-buffer (global-map "C-x")
    "Kill Buffer"
    ("k" (lambda () (interactive) (kill-buffer nil)) "assassinate buffer" :color red)
    ("K" kill-buffer "kill buffer")
    ("d" kill-dired-buffers "kill dired buffers")
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
  (defhydra hydra-cedit (global-map "C-c e")
    "Cedit"
    ("f" cedit-forward-char "fwd")
    ("b" cedit-backward-char "bwd")
    ("a" cedit-beginning-of-statement "beg")
    ("e" cedit-end-of-statement "end")
    ("d" cedit-down-block "down")
    ("<down>" cedit-down-block "down")
    ("u" cedit-up-block-forward "fup")
    ("<up>" cedit-up-block-backward "bup")
    ("U" cedit-up-block-backward "bup")
    ("s" cedit-slurp "slurp")
    ("<right>" cedit-slurp "slurp")
    ("B" cedit-barf "barf")
    ("<left>" cedit-barf "barf")
    ("r" cedit-raise "raise" :exit t)
    ("k" cedit-splice-killing-backward "splice bwd" :exit t)
    ("w" cedit-wrap-brace "wrap" :exit t)
    )
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
  (defhydra hydra-string-inflection (global-map "C-c")
    "String Inflection"
    ("I" string-inflection-cycle "cycle")
    ("u" string-inflection-underscore "under_bar")
    ("c" string-inflection-lower-camelcase "littleCamel")
    ("C" string-inflection-camelcase "BigCamel")
    ("j" string-inflection-java-style-cycle "java cycle")
    ("q" nil "quit"))
  (defhydra hydra-smerge
    (:color pink :hint nil :post (smerge-auto-leave))
    "
^Move^       ^Keep^               ^Diff^                 ^Other^
^^-----------^^-------------------^^---------------------^^-------
_n_ext       _b_ase               _<_: upper/base        _C_ombine
_p_rev       _u_pper              _=_: upper/lower       _r_esolve
^^           _l_ower              _>_: base/lower        _k_ill current
^^           _a_ll                _R_efine
^^           _RET_: current       _E_diff
"
    ("n" smerge-next)
    ("p" smerge-prev)
    ("b" smerge-keep-base)
    ("u" smerge-keep-upper)
    ("l" smerge-keep-lower)
    ("a" smerge-keep-all)
    ("RET" smerge-keep-current)
    ("\C-m" smerge-keep-current)
    ("<" smerge-diff-base-upper)
    ("=" smerge-diff-upper-lower)
    (">" smerge-diff-base-lower)
    ("R" smerge-refine)
    ("E" smerge-ediff)
    ("C" smerge-combine-with-next)
    ("r" smerge-resolve)
    ("k" smerge-kill-current)
    ("ZZ" (lambda ()
            (interactive)
            (save-buffer)
            (bury-buffer))
     "Save and bury buffer" :color blue)
    ("q" nil "cancel" :color blue))
  (add-hook 'smerge-mode-hook (lambda ()
                                (when smerge-mode
                                  (hydra-smerge/body))))
  )

;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
