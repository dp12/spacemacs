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
    fiplr
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar search-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function search/init-<package-search>
;;
(defun search/init-fiplr ()
  "Initialize my package"
  (use-package fiplr
    :init
    (progn
      ))
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
