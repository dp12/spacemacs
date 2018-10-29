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
    (cquery :location local)
    forth-mode
    ;; irony
    ;; company-irony
    lsp-mode
    company-lsp
    lsp-ui
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar progconfig-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function progconfig/init-<package-progconfig>
;;

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

(defun progconfig/init-cquery ()
  "Initialize cquery"
  (use-package cquery
    :config
    (setq cquery-executable (expand-file-name "~/cquery/build/release/bin/cquery"))
    (setq cquery-sem-highlight-method 'overlay)
    (cquery-use-default-rainbow-sem-highlight)
    (evil-set-initial-state 'cquery-tree-mode 'emacs)
    )
  )

(defun progconfig/init-lsp-mode ()
  "Initialize lsp-mode"
  (use-package lsp-mode
    :config
    (add-hook 'c-mode-hook 'lsp-cquery-enable)
    (add-hook 'c++-mode-hook 'lsp-cquery-enable)
    (add-hook 'python-mode-hook 'lsp-python-enable)
    (setq lsp-message-project-root-warning t)
    (spacemacs|diminish lsp-mode "Ⓛ")
    ;; (with-eval-after-load 'lsp-mode
    ;;   (require 'lsp-flycheck))
    ))

(defun progconfig/init-lsp-ui ()
  "Initialize lsp-ui"
  (use-package lsp-ui
    :config
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)))

(defun progconfig/init-company-lsp ()
  (use-package company-lsp
    :config
    (setq company-lsp-async t)
    ;; (setq company-lsp-cache-candidates nil)
    ;; (setq company-transformers nil)
    (push 'company-lsp company-backends)))

;; Use tab to do yasnippet expansion, company-complete, or tab indent
(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

;; Python
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq python-indent 4)
            ))

;; C-like languages (e.g. C, C++, Java, Python)
;; (add-hook 'c-mode-common-hook
(add-hook 'prog-mode-hook
          (lambda ()
            ;; ggtags breaks iedit unless the below is nil
            (setq ggtags-highlight-tag nil)
            (ggtags-mode t)
            (spacemacs|diminish ggtags-mode ⓖ)
            (setq semantic-stickyfunc-show-only-functions-p t)
            (define-key ggtags-navigation-map (kbd "M-<up>") 'ggtags-navigation-previous-file)
            (define-key ggtags-navigation-map (kbd "M-<down>") 'ggtags-navigation-next-file)
            (define-key evil-normal-state-map (kbd "M-<left>") 'ggtags-prev-mark)
            (define-key evil-normal-state-map (kbd "M-<right>") 'ggtags-next-mark)
            (local-set-key (kbd "C-M->") 'insert-period)
            (local-set-key (kbd "C-M-;") 'insert-c-terminator)
            (local-set-key (kbd "C-M-:") 'insert-function-call)
            ;; (spacemacs/toggle-fill-column-indicator-on)
            (dtrt-indent-mode t)
            (spacemacs|diminish dtrt-indent-mode "ⓓ")
            ;; Use 8 to /* wrap */ a word
            (push '(?8 . ("/* " . " */")) evil-surround-pairs-alist)
            ;; Treat _ as PART_OF_A_WORD
            (modify-syntax-entry ?_ "w")
            ;; Indent case labels in switch-case statements
            (c-set-offset 'case-label '+)
            ;; Visual-line-mode slows down swiper
            (setq visual-line-mode nil)
            (setq c-auto-newline nil)
            (setq c-default-style "linux"
                  c-basic-offset 4)
            (local-set-key [tab] 'tab-indent-or-complete)))

;; Forth
(add-to-list 'load-path "~/.spacemacs.d/layers/progconfig/")
(defun progconfig/init-forth-mode ()
  (use-package forth-mode :defer t))
(add-to-list 'auto-mode-alist '("\\.eForth\\'" . forth-mode))

;; Intel Hex mode
(require 'intel-hex-mode)

(defun gdb-get-breakpoint-str (breakpoint-type)
  "Return string of the form 'b foo.c:108'"
  (concat breakpoint-type " "
          (uniquify-buffer-base-name) ":"
          (number-to-string (line-number-at-pos))))

(defun gdb-set-fast-breakpoint ()
  "Insert breakpoint in ~/.gdbinit before line with the 'end #FBB' marker"
  (interactive)
  (let ((insert-br-cmd  "awk '/end #FBB/ { print \"  %s\"; print; next }1' ~/.gdbinit > ~/.gdbinit.tmp && cp ~/.gdbinit.tmp ~/.gdbinit")
        (breakpoint-type (if current-prefix-arg "tb" "b")))
    (shell-command
     (format insert-br-cmd (gdb-get-breakpoint-str breakpoint-type)))))

(with-eval-after-load 'popup
  (require 'git-complete))

;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
