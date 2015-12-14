;;; packages.el --- evil-extras Layer packages File for Spacemacs
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
(setq evil-extras-packages
    '(
      evil-mc
      ))

;; List of packages to exclude.
(setq evil-extras-excluded-packages '())

;; For each package, define a function evil-extras/init-<package-name>
;;
(defun evil-extras/init-evil-mc ()
  "Initialize my package"
  (use-package evil-mc
    :init
    (progn
      (defvar evil-mc-mode-line-prefix "ⓜ"
        "Override of the default mode line string for `evil-mc-mode'.")
      ;; (global-evil-mc-mode 1)
      ))
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
