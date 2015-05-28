;;; packages.el --- progconfig Layer packages File for Spacemacs
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

(defvar progconfig-packages
  '(
    ;; package progconfigs go here
    corral
    ws-butler
    dtrt-indent
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar progconfig-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function progconfig/init-<package-progconfig>
;;
(defun progconfig/init-corral ()
  "Initialize corral"
  (use-package corral
    :init
    (progn
      (global-set-key (kbd "M-(") 'corral-parentheses-backward)
      (global-set-key (kbd "M-)") 'corral-parentheses-forward)
      (global-set-key (kbd "M-[") 'corral-brackets-backward)
      (global-set-key (kbd "M-]") 'corral-brackets-forward)
      (global-set-key (kbd "M-{") 'corral-braces-backward)
      (global-set-key (kbd "M-}") 'corral-braces-forward)
      (global-set-key (kbd "M-\"") 'corral-double-quotes-backward)
      (electric-pair-mode 1))
    ))

(defun progconfig/init-ws-butler ()
  (use-package ws-butler
    :init
    (progn
      (ws-butler-mode 1)))
  )

(defun progconfig/init-dtrt-indent ()
  (use-package dtrt-indent
    :init
    (progn
      (dtrt-indent-mode t)))
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
