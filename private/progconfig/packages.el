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
    dtrt-indent
    irony
    company-irony
    rtags
    evil-multiedit
    string-inflection
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
      (defun corral-at-point (corral-command)
        (interactive)
        (when (and (eq evil-move-cursor-back t) (eq evil-state 'insert))
          (right-char))
        (evil-escape)
        (setq current-prefix-arg '(4))
        (call-interactively corral-command))

      (global-set-key (kbd "M-9") 'corral-parentheses-backward)
      (global-set-key (kbd "M-0") 'corral-parentheses-forward)
      (define-key evil-normal-state-map (kbd "M-9") 'corral-parentheses-backward)
      (define-key evil-normal-state-map (kbd "M-0") 'corral-parentheses-forward)
      (global-set-key (kbd "M-[") 'corral-brackets-backward)
      (global-set-key (kbd "M-]") 'corral-brackets-forward)
      (global-set-key (kbd "M-{") 'corral-braces-backward)
      (global-set-key (kbd "M-}") 'corral-braces-forward)
      (global-set-key (kbd "M-'") 'corral-single-quotes-forward)
      (global-set-key (kbd "M-\"") 'corral-double-quotes-forward)
      ;; (global-set-key (kbd "C-M-0") (kbd "<escape> SPC u M-0"))
      (global-set-key (kbd "C-M-0") (lambda () (interactive)
                                      (corral-at-point 'corral-parentheses-forward)))
      (global-set-key (kbd "C-M-]") (lambda () (interactive)
                                      (corral-at-point 'corral-brackets-forward)))
      (global-set-key (kbd "C-M-}") (lambda () (interactive)
                                      (corral-at-point 'corral-braces-forward)))
      (global-set-key (kbd "C-M-\"") (lambda () (interactive)
                                       (corral-at-point 'corral-double-quotes-forward)))
      (global-set-key (kbd "C-M-'") (lambda () (interactive)
                                       (corral-at-point 'corral-single-quotes-forward)))
      )
    ))

(defun progconfig/init-dtrt-indent ()
  (use-package dtrt-indent)
  )

(defun progconfig/init-irony ()
  (use-package irony
    :diminish "Ⓘ"
    :defer t
    :init
    ;; (add-hook 'c++-mode-hook 'irony-mode)
    ;; (add-hook 'c-mode-hook 'irony-mode)
    ;; (add-hook 'objc-mode-hook 'irony-mode)
    :config
    ;; replace the `completion-at-point' and `complete-symbol' bindings in
    ;; irony-mode's buffers by irony-mode's function
    (define-key evil-normal-state-map (kbd "[r") 'irony-mode)
    (defun my-irony-mode-hook ()
      (define-key irony-mode-map [remap completion-at-point]
        'irony-completion-at-point-async)
      (define-key irony-mode-map [remap complete-symbol]
        'irony-completion-at-point-async))
    (add-hook 'irony-mode-hook 'my-irony-mode-hook)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    )
  )

(defun progconfig/init-company-irony ()
  (use-package company-irony
    :config
    (eval-after-load 'company
      '(add-to-list 'company-backends 'company-irony)))
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

(defun progconfig/init-rtags ()
  (use-package rtags
  :init
  ;; make sure you have company-mode installed
  :ensure company
  :config
  (progn
    (require 'company-rtags)
    (add-to-list 'company-backends 'company-rtags)
    (setq company-rtags-begin-after-member-access t)
    (setq rtags-completions-enabled t)
    (rtags-evil-standard-keybindings 'c-mode)
    (rtags-evil-standard-keybindings 'c++-mode))
  ))

(defun progconfig/init-evil-multiedit ()
  "Initialize evil-multiedit"
  (use-package evil-multiedit
    :config
    (evil-multiedit-default-keybinds)
    ))

(defun progconfig/init-string-inflection ()
  (use-package string-inflection))

(defun my-expand-lines ()
  (interactive)
  (let ((hippie-expand-try-functions-list
         '(try-expand-line)))
    (call-interactively 'hippie-expand)))

;; Done, now we just use it as a clause in our make-hippie-expand-function (as above)
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-tag))

; Comment toggle
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-M-;") 'comment-dwim)

;; Company
(eval-after-load 'company
  '(progn
     (setq company-show-numbers t)
))

;; Gtags
(with-eval-after-load 'helm-gtags
  (diminish 'helm-gtags-mode))

;; Python
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq python-indent 4)
            ))

;; C-like languages (e.g. C, C++, Java, Python)
(add-hook 'c-mode-common-hook
          (lambda()
            ;; ggtags breaks iedit unless the below is nil
            (setq ggtags-highlight-tag nil)
            (ggtags-mode t)
            (diminish 'ggtags-mode)
            (define-key ggtags-navigation-map (kbd "M-<up>") 'ggtags-navigation-previous-file)
            (define-key ggtags-navigation-map (kbd "M-<down>") 'ggtags-navigation-next-file)
            (define-key evil-normal-state-map (kbd "M-<left>") 'ggtags-prev-mark)
            (define-key evil-normal-state-map (kbd "M-<right>") 'ggtags-next-mark)
            ;; (spacemacs/toggle-fill-column-indicator-on)
            (dtrt-indent-mode t)
            ;; Use 8 to /* wrap */ a word
            (push '(?8 . ("/* " . " */")) evil-surround-pairs-alist)
            ;; Treat _ as PART_OF_A_WORD
            (modify-syntax-entry ?_ "w")
            ;; Indent case labels in switch-case statements
            (c-set-offset 'case-label '+)
            ;; Visual-line-mode slows down swiper
            (setq visual-line-mode nil)
            (setq c-default-style "linux"
                  c-basic-offset 4)
            ))

;; Forth
(add-to-list 'load-path "~/spacemacs/private/progconfig/")
(require 'gforth)
(add-to-list 'auto-mode-alist '("\\.eForth\\'" . forth-mode))

;; Intel Hex mode
(require 'intel-hex-mode)

;; Rotate-text (cycle between labels)
(require 'rotate-text)
(autoload 'rotate-text "rotate-text" nil t)
(autoload 'rotate-text-backward "rotate-text" nil t)
(setq rotate-text-words '(("true" "false")
                          ("front" "rear" "back")
                          ("left" "right")
                          ("set" "get")
                          ("uint8_t" "uint16_t" "uint32_t")))
(global-set-key (kbd "C-%") 'rotate-text)
(global-set-key (kbd "M-P") 'rotate-text-backward)
(global-set-key (kbd "M-p") 'rotate-text)

;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
