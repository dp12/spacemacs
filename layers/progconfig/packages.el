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
    company-irony
    company-lsp
    forth-mode
    gxref
    irony
    lsp-mode
    lsp-ui
    ;; rtags
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
    (spacemacs|diminish lsp-mode "Ⓛ")
    ;; (with-eval-after-load 'lsp-mode
    ;;   (require 'lsp-flycheck))
    ))

(defun progconfig/init-lsp-ui ()
  "Initialize lsp-ui"
  (use-package lsp-ui
    :config
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    ))

(defun progconfig/init-company-lsp ()
  (use-package company-lsp
    :config
    (setq company-lsp-async t)
    ;; (setq company-lsp-cache-candidates nil)
    ;; (setq company-transformers nil)
    (push 'company-lsp company-backends)
    ))

(defun progconfig/init-gxref ()
  "Initialize gxref"
  (use-package gxref
    :config
    (add-to-list 'xref-backend-functions 'gxref-xref-backend)
    ))

;; Gtags
(with-eval-after-load 'helm-gtags
  (diminish 'helm-gtags-mode))

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
  (define-key ripgrep-search-mode-map (kbd "d") 'delete-search-buffer-regexp)
  (define-key ripgrep-search-mode-map (kbd "X") 'narrow-search-buffer-to-regexp)
  (define-key ripgrep-search-mode-map (kbd "u") 'narrow-search-buffer-undo)
  (define-key ripgrep-search-mode-map (kbd "C-r") 'narrow-search-buffer-redo))
(with-eval-after-load "ggtags"
  (define-key ggtags-global-mode-map (kbd "d") 'delete-search-buffer-regexp)
  (define-key ggtags-global-mode-map (kbd "X") 'narrow-search-buffer-to-regexp)
  (define-key ggtags-global-mode-map (kbd "u") 'narrow-search-buffer-undo)
  (define-key ggtags-global-mode-map (kbd "C-r") 'narrow-search-buffer-redo)
  ;; turn off file path abbreviations
  (add-hook 'ggtags-global-mode-hook (lambda () (ggtags-navigation-visible-mode nil))))


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
(add-hook 'c-mode-common-hook
          (lambda()
            ;; ggtags breaks iedit unless the below is nil
            (setq ggtags-highlight-tag nil)
            (ggtags-mode t)
            (spacemacs|diminish ggtags-mode ⓖ)
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
            (local-set-key [tab] 'tab-indent-or-complete)
            (setq dumb-jump-force-searcher 'rg)
            ))
(add-hook 'spacemacs-jump-handlers-c-mode 'dumb-jump-go)
(add-hook 'spacemacs-jump-handlers-c-mode 'ggtags-find-tag-dwim)
(add-hook 'spacemacs-jump-handlers-c++-mode 'dumb-jump-go)
(add-hook 'spacemacs-jump-handlers-c++-mode 'ggtags-find-tag-dwim)

;; Forth
(add-to-list 'load-path "~/.spacemacs.d/layers/progconfig/")
(defun progconfig/init-forth-mode ()
  (use-package forth-mode))
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
