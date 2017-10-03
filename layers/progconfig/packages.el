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

(defun grab-carg ()
  (let (p1 p2)
    (backward-char)
    (setq p2 (point))
    (backward-word)
    (setq p1 (point))
    (buffer-substring-no-properties p1 p2)))

(defun grab-cargs ()
  (let (args cdecl-end-position)
    (back-to-indentation)
    (save-excursion
      (search-forward ")")
      (setq cdecl-end-position (point)))
    (while (search-forward "," cdecl-end-position t)
      (save-excursion
        (add-to-list 'args (grab-carg)))) ;; collect all args except last
    (search-forward ")" cdecl-end-position t)
    (add-to-list 'args (grab-carg)) ;; collect last arg
    (reverse args)
    (if (string-match "void" (car (reverse args)))
        nil ;; return nil if no arguments, i.e. void
      (reverse args))))

(defun returns-void ()
  (let (start-position end-position)
    (back-to-indentation)
    (setq start-position (point))
    (save-excursion
      (search-forward "(")
      (setq end-position (point)))
    (string-match "void" (buffer-substring-no-properties start-position end-position))))

; Autogenerates doxygen template for function
(defun insert-doxygen-stub ()
  (interactive)
  (let ((doxygen (save-excursion
                   (concat "/**\n"
                           " * @brief\n"
                           (when (grab-cargs)
                             (apply #'concatenate 'string
                                    (mapcar (lambda (c) (concat " * @param[in] " c "\n"))
                                            (grab-cargs))))
                           (when (not (returns-void))
                           " * @return\n")
                           " */"))))
    (back-to-indentation)
    (insert "\n")
    (forward-line -1)
    (save-excursion
      (insert doxygen))
    (forward-line)
    (end-of-line)
    (message doxygen)))

; Autogenerates void stub for function
(defun insert-void-stub ()
  (interactive)
  (let (args)
    (setq args (concat "{\n"
                       (apply #'concatenate 'string
                              (mapcar (lambda (c) (concat "    (void)" c ";\n"))
                                      (grab-cargs)))
                       "}"))
    (save-excursion
      (end-of-line)
      (backward-char)
      (when (= (char-after) 59)
        (delete-char 1)))
    (forward-line)
    (insert args)
    (message args)))

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
(add-hook 'spacemacs-jump-handlers-c-mode 'dumb-jump-go)
(add-hook 'spacemacs-jump-handlers-c-mode 'ggtags-find-tag-dwim)
(add-hook 'spacemacs-jump-handlers-c++-mode 'dumb-jump-go)
(add-hook 'spacemacs-jump-handlers-c++-mode 'ggtags-find-tag-dwim)

;; Forth
(add-to-list 'load-path "~/.spacemacs.d/layers/progconfig/")
(require 'gforth)
(add-to-list 'auto-mode-alist '("\\.eForth\\'" . forth-mode))

;; Intel Hex mode
(require 'intel-hex-mode)

(setq rotate-text-rotations
  '(("true" "false")
    ("TRUE" "FALSE")
    ("forward" "reverse")
    ("FORWARD" "REVERSE")
    ("uint8_t" "uint16_t" "uint32_t")
    ("int8_t" "int16_t" "int32_t")
    ("set" "get")
    ("SET" "GET")
    ("in" "out")
    ("IN" "OUT")
    ("ifdef" "ifndef")
    ("left" "right")
    ("LEFT" "RIGHT")
    ("front" "rear" "back")
    ("FRONT" "REAR" "BACK")
    ("min" "max")
    ("MIN" "MAX")
    ("prev" "next")
    ("PREV" "NEXT")
    ("if" "else" "else if")
    ("high" "low")
    ("HIGH" "LOW")
    ("on" "off")
    ("ON" "OFF")
    ("yes" "no")))

(defun rotate-region (beg end)
  "Rotate all matches in `rotate-text-rotations' between point and mark."
  (interactive "r")
  (let ((regexp (rotate-convert-rotations-to-regexp
		 rotate-text-rotations))
	(end-mark (copy-marker end)))
    (save-excursion
      (goto-char beg)
      (while (re-search-forward regexp (marker-position end-mark) t)
	(let* ((found (match-string 0))
	       (replace (rotate-next found)))
	  (replace-match replace))))))

(defun rotate-string (string &optional rotations)
  "Rotate all matches in STRING using associations in ROTATIONS.
If ROTATIONS are not given it defaults to `rotate-text-rotations'."
  (let ((regexp (rotate-convert-rotations-to-regexp
		 (or rotations rotate-text-rotations)))
	(start 0))
    (while (string-match regexp string start)
      (let* ((found (match-string 0 string))
	     (replace (rotate-next
		       found
		       (or rotations rotate-text-rotations))))
	(setq start (+ (match-end 0)
		       (- (length replace) (length found))))
	(setq string (replace-match replace nil t string))))
    string))

(defun rotate-next (string &optional rotations)
  "Return the next element after STRING in ROTATIONS."
  (let ((rots (rotate-get-rotations-for
	       string
	       (or rotations rotate-text-rotations))))
    (if (> (length rots) 1)
	(error (format "Ambiguous rotation for %s" string))
      (if (< (length rots) 1)
	  ;; If we get this far, this should not occur:
	  (error (format "Unknown rotation for %s" string))
	(let ((occurs-in-rots (member string (car rots))))
	  (if (null occurs-in-rots)
	      ;; If we get this far, this should *never* occur:
	      (error (format "Unknown rotation for %s" string))
	  (if (null (cdr occurs-in-rots))
	      (caar rots)
	    (cadr occurs-in-rots))))))))

(defun rotate-get-rotations-for (string &optional rotations)
  "Return the string rotations for STRING in ROTATIONS."
  (remq nil (mapcar (lambda (rot) (if (member string rot) rot))
		    (or rotations rotate-text-rotations))))

(defun rotate-convert-rotations-to-regexp (rotations)
  (regexp-opt (rotate-flatten-list rotations)))

(defun rotate-flatten-list (list-of-lists)
  "Flatten LIST-OF-LISTS to a single list.
Example:
  (rotate-flatten-list '((a b c) (1 ((2 3)))))
    => (a b c 1 2 3)"
  (if (null list-of-lists)
      list-of-lists
    (if (listp list-of-lists)
	(append (rotate-flatten-list (car list-of-lists))
		(rotate-flatten-list (cdr list-of-lists)))
      (list list-of-lists))))

(defun rotate-word-at-point ()
  "Rotate word at point based on sets in `rotate-text-rotations'."
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'word))
        (opoint (point)))
    (when (consp bounds)
      (let ((beg (car bounds))
            (end (copy-marker (cdr bounds))))
        (rotate-region beg end)
        (goto-char (if (> opoint end) end opoint))))))

(defun gdb-get-breakpoint-str ()
  "Return string of the form 'b foo.c:108'"
  (concat "b "
          (uniquify-buffer-base-name) ":"
          (number-to-string (line-number-at-pos))))

(defun gdb-set-fast-breakpoint ()
  "Insert breakpoint in ~/.gdbinit before line with the 'end #FBB' marker"
  (interactive)
  (let ((insert-br-cmd  "awk '/end #FBB/ { print \"  %s\"; print; next }1' ~/.gdbinit > ~/.gdbinit.tmp && cp ~/.gdbinit.tmp ~/.gdbinit"))
    (shell-command
     (format insert-br-cmd (gdb-get-breakpoint-str)))))

(with-eval-after-load 'popup
  (require 'git-complete))

;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
