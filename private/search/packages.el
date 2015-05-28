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
    ag
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar search-excluded-packages '()
  "List of packages to exclude.")

(defvar ag-project-name "roost")
(defvar ag-project-root "~/roost")

;; based on projectile-ag
(defun ag-roost (search-term &optional arg)
  "Run an ag search with SEARCH-TERM in the project.
With an optional prefix argument ARG SEARCH-TERM is interpreted as a
regular expression."
  (interactive
   (list (read-from-minibuffer
          (format "[%s] %s" ag-project-name "Ag search for: ")
          (substring-no-properties (or (thing-at-point 'symbol) "")))
         current-prefix-arg))
  (if (fboundp 'ag-regexp)
      (let ((ag-command (if arg 'ag-regexp 'ag))
            ;; reset the prefix arg, otherwise it will affect the ag-command
            (current-prefix-arg nil))
        (funcall ag-command search-term ag-project-root))
    (error "Ag is not available")))

;; For each package, define a function search/init-<package-search>
;;
(defun search/init-ag ()
  "Initialize my package"
  (evil-leader/set-key "ar" 'ag-roost)
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
