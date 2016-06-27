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
    counsel
    dired-narrow
    fiplr
    find-file-in-project
    swiper
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar search-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function search/init-<package-search>
;;
(defun search/init-counsel ()
  "Initialize counsel"
  (use-package counsel
    :init
    (progn
      (ivy-mode t)
      (eval-after-load "diminish"
        '(diminish 'ivy-mode "ⓥ"))
      (setq ivy-use-virtual-buffers t)
      (global-set-key (kbd "C-c C-r") 'ivy-resume)
      (global-set-key (kbd "<f6>") 'ivy-resume)
      (global-set-key (kbd "M-x") 'counsel-M-x)
      (global-set-key (kbd "C-x C-f") 'counsel-find-file)
      (global-set-key (kbd "<f1> f") 'counsel-describe-function)
      (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
      (global-set-key (kbd "<f1> l") 'counsel-load-library)
      (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
      (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
      (global-set-key (kbd "C-c g") 'counsel-git)
      (global-set-key (kbd "C-c j") 'counsel-git-grep)
      (global-set-key (kbd "C-c k") 'counsel-ag)
      (global-set-key (kbd "C-x l") 'counsel-locate)
      )))

(defun search/init-dired-narrow ()
  "Initialize dired-narrow"
  (use-package dired-narrow))

(defun search/init-fiplr ()
  "Initialize fiplr"
  (use-package fiplr))

(defun search/init-find-file-in-project ()
  "Initialize find-file-in-project"
  (use-package find-file-in-project))

(defun search/init-swiper ()
  "Initialize swiper"
  (use-package swiper
    :init
    (global-set-key "\C-s" 'swiper)
    (define-key ivy-minibuffer-map (kbd "C-w") 'ivy-next-history-element)
    (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line-or-history)
    (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line-or-history))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
