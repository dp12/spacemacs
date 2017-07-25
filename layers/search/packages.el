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
    ;; package searchs go here
    dired-narrow
    dired-subtree
    fiplr
    find-file-in-project
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

(defun search/init-fiplr ()
  "Initialize fiplr"
  (use-package fiplr))

(defun search/init-find-file-in-project ()
  "Initialize find-file-in-project"
  (use-package find-file-in-project))

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package