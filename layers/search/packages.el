;;; packages.el --- search Layer packages File for Spacemacs
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

(defvar search-packages
  '(
    ;; search packages go here
    dired-narrow
    dired-subtree
    dumb-jump
    gxref
    treemacs
    ;; rtags
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar search-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function search/init-<package-search>

(defun search/init-dired-narrow ()
  "Initialize dired-narrow"
  (use-package dired-narrow))

(defun search/init-dired-subtree ()
  (use-package dired-subtree
    :ensure t
    :after dired
    :config
    (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
    (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map)))

(defun search/init-dumb-jump ()
  "Initialize dumb-jump"
  (use-package dumb-jump
    :defer t
    :config
    (setq dumb-jump-force-searcher 'rg)))

(add-hook 'spacemacs-jump-handlers-c-mode 'dumb-jump-go)
(add-hook 'spacemacs-jump-handlers-c-mode 'ggtags-find-tag-dwim)
(add-hook 'spacemacs-jump-handlers-c++-mode 'dumb-jump-go)
(add-hook 'spacemacs-jump-handlers-c++-mode 'ggtags-find-tag-dwim)

;; ggtags and gxref
(defun search/init-gxref ()
  "Initialize gxref"
  (use-package gxref
    :config
    (add-to-list 'xref-backend-functions 'gxref-xref-backend)))

(with-eval-after-load "ggtags"
  (define-key ggtags-navigation-map (kbd "M-<up>") 'ggtags-navigation-previous-file)
  (define-key ggtags-navigation-map (kbd "M-<down>") 'ggtags-navigation-next-file)
  (define-key evil-normal-state-map (kbd "M-<left>") 'ggtags-prev-mark)
  (define-key evil-normal-state-map (kbd "M-<right>") 'ggtags-next-mark))

(with-eval-after-load "ripgrep"
  (define-key ripgrep-search-mode-map (kbd "M-<up>") 'compilation-previous-error)
  (define-key ripgrep-search-mode-map (kbd "M-<down>") 'compilation-next-error))


(defun ggtags-find-declaration (name)
  (interactive (list (ggtags-read-tag 'reference current-prefix-arg)))
  (ggtags-setup-libpath-search 'reference name)
  (ggtags-find-tag 'reference "--" (concat (shell-quote-argument name) " | grep '\\.h\\|hpp:'")))

(defun narrow-search-buffer-to-regexp (&optional regexp)
  (interactive
   (list (read-regexp "Narrow regex: ")))
  (buffer-enable-undo)
  (read-only-mode -1)
  (save-excursion
    (goto-line 5) ;; don't delete search command
    (delete-non-matching-lines regexp))
  (read-only-mode 1))

(defun delete-search-buffer-strings (&optional string)
  (interactive
   (list (read-string "Delete string(s): ")))
  (buffer-enable-undo)
  (read-only-mode -1)
  (save-excursion
    (goto-line 5) ;; don't delete search command
    ;; Allow caller to specific multiple search strings for deletion
    (delete-matching-lines (regexp-opt (split-string string " "))))
  (read-only-mode 1))

(defun delete-search-buffer-regexp (&optional regexp)
  (interactive
   (list (read-regexp "Delete regex: ")))
  (buffer-enable-undo)
  (read-only-mode -1)
  (save-excursion
    (goto-line 5) ;; don't delete search command
    (delete-matching-lines regexp))
  (read-only-mode 1))

(defun narrow-search-buffer-undo ()
  (interactive)
  (read-only-mode -1)
  (if (fboundp 'undo-tree-undo)
      (undo-tree-undo)
    (undo))
  (read-only-mode 1))

(defun narrow-search-buffer-redo ()
  (interactive)
  (read-only-mode -1)
  (if (fboundp 'undo-tree-redo)
    (undo-tree-redo)
    (redo))
  (read-only-mode 1))

(with-eval-after-load "ripgrep"
  (define-key ripgrep-search-mode-map (kbd "d") 'delete-search-buffer-strings)
  (define-key ripgrep-search-mode-map (kbd "X") 'narrow-search-buffer-to-regexp)
  (define-key ripgrep-search-mode-map (kbd "u") 'narrow-search-buffer-undo)
  (define-key ripgrep-search-mode-map (kbd "C-r") 'narrow-search-buffer-redo))
(with-eval-after-load "ggtags"
  (define-key ggtags-global-mode-map (kbd "o") 'ggtags-navigation-visible-mode)
  (define-key ggtags-global-mode-map (kbd "d") 'delete-search-buffer-strings)
  (define-key ggtags-global-mode-map (kbd "X") 'narrow-search-buffer-to-regexp)
  (define-key ggtags-global-mode-map (kbd "u") 'narrow-search-buffer-undo)
  (define-key ggtags-global-mode-map (kbd "C-r") 'narrow-search-buffer-redo)
  ;; turn off file path abbreviations
  ;; (add-hook 'ggtags-global-mode-hook (lambda () (ggtags-navigation-visible-mode nil)))
  )


(defun rtags-evil-standard-keybindings (mode)
  (evil-leader/set-key-for-mode mode
    "r." 'rtags-find-symbol-at-point
    "r," 'rtags-find-references-at-point
    "rv" 'rtags-find-virtuals-at-point
    "rV" 'rtags-print-enum-value-at-point
    "r/" 'rtags-find-all-references-at-point
    "rY" 'rtags-cycle-overlays-on-screen
    "r>" 'rtags-find-symbol
    "r<" 'rtags-find-references
    "r[" 'rtags-location-stack-back
    "r]" 'rtags-location-stack-forward
    "rD" 'rtags-diagnostics
    "rG" 'rtags-guess-function-at-point
    "rp" 'rtags-set-current-project
    "rP" 'rtags-print-dependencies
    "re" 'rtags-reparse-file
    "rE" 'rtags-preprocess-file
    "rR" 'rtags-rename-symbol
    "rM" 'rtags-symbol-info
    "rS" 'rtags-display-summary
    "rO" 'rtags-goto-offset
    "r;" 'rtags-find-file
    "rF" 'rtags-fixit
    "rL" 'rtags-copy-and-print-current-location
    "rX" 'rtags-fix-fixit-at-point
    "rB" 'rtags-show-rtags-buffer
    "rI" 'rtags-imenu
    "rT" 'rtags-taglist
    "rh" 'rtags-print-class-hierarchy
    "ra" 'rtags-print-source-arguments
    )
  )

(defun search/init-treemacs ()
  "Initialize treemacs"
  (use-package treemacs
    :ensure t
    :defer t
    :config
    (progn
      (use-package treemacs-evil
        :ensure t
        :demand t)
      (setq treemacs-follow-after-init          t
            treemacs-width                      35
            treemacs-indentation                2
            treemacs-git-integration            t
            treemacs-collapse-dirs              3
            treemacs-silent-refresh             nil
            treemacs-change-root-without-asking nil
            treemacs-sorting                    'alphabetic-desc
            treemacs-show-hidden-files          t
            treemacs-never-persist              nil
            treemacs-is-never-other-window      nil
            treemacs-goto-tag-strategy          'refetch-index)

      (treemacs-follow-mode t)
      (treemacs-filewatch-mode t))))

(defun search/init-rtags ()
  (use-package rtags
    :init
    ;; make sure you have company-mode installed
    :ensure company
    :defer t
    :config
    (progn
      (require 'company-rtags)
      (add-to-list 'company-backends 'company-rtags)
      (setq company-rtags-begin-after-member-access t)
      (setq rtags-completions-enabled t)
      (rtags-evil-standard-keybindings 'c-mode)
      (rtags-evil-standard-keybindings 'c++-mode))))

(defun minibuffer-insert (string &optional eol)
  (save-excursion
    (if eol
        (end-of-line)
      (beginning-of-line))
    (insert string)))

(defun minibuffer-munch (&optional eol)
  (save-excursion
    (if eol
        (end-of-line)
      (beginning-of-line)
      (delete-region (point) (progn (forward-word-strictly) (point)))
      (delete-horizontal-space))))

(with-eval-after-load 'ivy
  (define-key ivy-minibuffer-map (kbd "C-c h") (lambda () (interactive) (minibuffer-insert "\\.h\\(pp\\)*$" t)))
  (define-key ivy-minibuffer-map (kbd "C-c c") (lambda () (interactive) (minibuffer-insert "\\.c\\(pp\\)*$" t)))
  (define-key ivy-minibuffer-map (kbd "C-c p") (lambda () (interactive) (minibuffer-insert "\\.py$" t)))
  (define-key ivy-minibuffer-map (kbd "C-c k") (lambda () (interactive) (minibuffer-munch))))

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
