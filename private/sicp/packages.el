;;; packages.el --- sicp Layer packages File for Spacemacs
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

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq sicp-packages
    '(
      ;; package sicps go here
      geiser
      quack
      ))

;; List of packages to exclude.
(setq sicp-excluded-packages '())

;; For each package, define a function sicp/init-<package-sicp>
;;
(defun sicp/init-quack ()
  "Initialize quack"
  (use-package quack)
  )

(defun sicp/init-geiser ()
  "Initialize geiser"
  (use-package geiser
    :init
    (progn
      (add-hook 'scheme-mode-hook 'geiser-mode)
      (setq geiser-active-implementations '(racket))
      )))

;; Custom Info Pages Setup
(require 'info)
(setq Info-directory-list
      (cons (expand-file-name "~/info/")
            Info-default-directory-list))

;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
