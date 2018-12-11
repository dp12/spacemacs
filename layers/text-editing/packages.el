;;; packages.el --- text-editing layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Daniel Ting <deep.paren.12@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `text-editing-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `text-editing/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `text-editing/pre-init-PACKAGE' and/or
;;   `text-editing/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst text-editing-packages
  '(
    corral
    dtrt-indent
    evil-multiedit
    parrot
    )
  "The list of Lisp packages required by the text-editing layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun text-editing/init-corral ()
  "Initialize corral"
  (use-package corral
    :defer t
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

(defun text-editing/init-dtrt-indent ()
  (use-package dtrt-indent :defer t))

(defun text-editing/init-evil-multiedit ()
  "Initialize evil-multiedit"
  (use-package evil-multiedit
    :defer t
    :config
    (evil-multiedit-default-keybinds)
    ))

(defun text-editing/init-parrot ()
  "Initialize parrot mode"
  (use-package parrot
    :defer nil
    :config
    (parrot-mode)
    (define-key evil-normal-state-map (kbd "[r") 'parrot-rotate-prev-word-at-point)
    (define-key evil-normal-state-map (kbd "]r") 'parrot-rotate-next-word-at-point)
    (add-hook 'mu4e-index-updated-hook #'parrot-start-animation)))


(defun my-inhibit-evil-briefcase-mode ()
  "Counter-act evil-briefcase."
  (add-hook 'after-change-major-mode-hook
            (lambda () (evil-briefcase-mode 0))
            :append :local))

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

(with-eval-after-load 'company
  (require 'hippie-exp)
  (require 'cl-lib)

  ;; Modified version of try-expand-line from hippie-exp.el v1.6 by Anders Holst
  ;; Changed to return the completion instead of calling he-substitute-string
  (defun my-try-expand-line (old)
    "Try to complete the current line to an entire line in the buffer.
The argument OLD has to be nil the first call of this function, and t
for subsequent calls (for further possible completions of the same
string).  It returns t if a new completion is found, nil otherwise."
    (let ((expansion ())
          (strip-prompt (and (get-buffer-process (current-buffer))
                             comint-use-prompt-regexp
                             comint-prompt-regexp)))
      (if (not old)
          (progn
            (he-init-string (he-line-beg strip-prompt) (point))
            (set-marker he-search-loc he-string-beg)
            (setq he-search-bw t)))

      (if (not (equal he-search-string ""))
          (save-excursion
            (save-restriction
              (if hippie-expand-no-restriction
                  (widen))
              ;; Try looking backward unless inhibited.
              (if he-search-bw
                  (progn
                    (goto-char he-search-loc)
                    (setq expansion (he-line-search he-search-string
                                                    strip-prompt t))
                    (set-marker he-search-loc (point))
                    (if (not expansion)
                        (progn
                          (set-marker he-search-loc he-string-end)
                          (setq he-search-bw ())))))

              (if (not expansion) ; Then look forward.
                  (progn
                    (goto-char he-search-loc)
                    (setq expansion (he-line-search he-search-string
                                                    strip-prompt nil))
                    (set-marker he-search-loc (point)))))))

      (if (not expansion)
          (progn
            (if old (he-reset-string))
            ())
        (progn
          expansion
          ))))

  (defun get-hippie-expand-lines ()
    (let (completions-list candidate)
      (setq candidate (my-try-expand-line nil))
      (if candidate
          (progn
            (when (not (member candidate completions-list))
                (push candidate completions-list))
            (while (progn
                     (setq candidate (my-try-expand-line t))
                     (if candidate
                         (when (not (member candidate completions-list))
                           (push candidate completions-list))
                       nil))))
        nil)
      completions-list))

  (defun company-hippie-line (command &optional arg &rest ignored)
    (interactive (list 'interactive))

    (cl-case command
      (interactive (company-begin-backend 'company-hippie-line))
      (prefix (and (not (looking-at "[:word:]"))
                   (let (p1 p2)
                    (save-excursion
                      (end-of-line)
                      (setq p2 (point))
                      (back-to-indentation)
                      (setq p1 (point)))
                    (buffer-substring-no-properties p1 p2))))
      (candidates (get-hippie-expand-lines))))
  ;; Uncomment for company to suggest line completion wherever possible
  ;; (add-to-list 'company-backends 'company-hippie-line)
  )

;; Copied from https://github.com/hlissner/doom-emacs/
;; doom-emacs/modules/completion/company/autoload.el
(defun +company/whole-lines (command &optional arg &rest ignored)
  "`company-mode' completion backend that completes whole-lines, akin to vim's
C-x C-l."
  (interactive (list 'interactive))
  (require 'company)
  (pcase command
    ('interactive (company-begin-backend '+company/whole-lines))
    ('prefix      (company-grab-line "^[\t\s]*\\(.+\\)" 1))
    ('candidates
     (all-completions
      arg
      (split-string
       (replace-regexp-in-string
        "^[\t\s]+" ""
        (concat (buffer-substring-no-properties (point-min) (line-beginning-position))
                (buffer-substring-no-properties (line-end-position) (point-max))))
       "\\(\r\n\\|[\n\r]\\)" t)))))
(global-set-key (kbd "C-x l") '+company/whole-lines)

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
        (delete-char 1))) ;; delete trailing semicolon if it's there
    (forward-line)
    (insert args)
    (message args)))

;; Insert header guards at point
(defun insert-header-guards ()
  (interactive)
  (let ((header-name (concat (replace-regexp-in-string "-" "_" (upcase (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))) "_H")))
    (save-excursion
      (beginning-of-line)
      (insert "#ifndef " header-name "\n#define " header-name "\n\n")
      (end-of-buffer)
      (insert "\n\n#endif /* " header-name " */"))))

(defun insert-period ()
  (interactive)
  (save-excursion
    (end-of-line)
    (when (/= (char-before) ?.) (insert "."))
    (evil-escape)))

;; (defun insert-c-terminator ()
;;   (interactive)
;;   (save-excursion
;;     (end-of-line)
;;     (when (/= (char-before) ?\;) (insert ";"))
;;       (evil-escape)))

(defun toggle-inline-string (string &optional bti)
  (unless (delete-inline-string string)
    (insert-string-without-dup string bti)))

(defun delete-inline-string (string)
  (save-excursion
    (end-of-line)
    (if (search-backward string (line-beginning-position) t)
        (progn
          (delete-region (match-beginning 0) (match-end 0))
          t)
      nil)))

(defun insert-string-without-dup (string &optional bti)
  (interactive)
  (save-excursion
    ;; TODO: go backward char like normal; if any characters match full-string
    ;; characters, do the filling operation; otherwise, insert at the beginning
    ;; if option is set; otherwise, insert at end
    (if bti
        (back-to-indentation)
      (end-of-line))
    (backward-char)
    (while (looking-at-p "[[:blank:]]")
      (backward-char))
    (let ((full-string string)
          (fill-start nil)
          (replace-str ""))
      (dotimes (i (length full-string))
        (when (= (aref full-string i) (char-after))
          (setq fill-start (+ i 1))
          (return)))
      (forward-char)
      (setq replace-str (substring full-string fill-start (length full-string)))
      (insert replace-str))))

(defun insert-org-checkbox ()
  (interactive)
  (toggle-inline-string "- [ ]" t))

(defun insert-c-terminator ()
  (interactive)
  (toggle-inline-string ";"))

(defun insert-function-call ()
  (interactive)
  (toggle-inline-string "();"))

(defun insert-if0 ()
  (interactive)
  (save-excursion
    (previous-line)
    (end-of-line)
    (insert "\n#if 0")))

(defun insert-endif ()
  (interactive)
  (save-excursion
    (next-line)
    (beginning-of-line)
    (insert "#endif\n")))

(defun insert-arrow-or-replace-period ()
  (interactive)
  (if (= (char-after) ?.)
      (delete-char 1)
    (when (not (string= evil-state "insert"))
      (forward-char 1)))
  (insert "->"))

;; Company
(eval-after-load 'company
  '(progn
     (setq company-show-numbers t)
))

;;(act-on-symbol-at-point 'flip-snake-kebab-region)
(defun act-on-symbol-at-point (func &rest r)
  (let (start end currently-using-snakecase-p)
    (save-excursion
      ;; Alternate regex:
      ;; (re-search-forward "[\]\[[:space:](){}<>]")
      (if (re-search-forward "[^A-Za-z0-9-_]" (line-end-position) t)
          (progn
            (backward-char)
            (setq end (point)))
        (setq end (line-end-position)))
      (if (re-search-backward "[^A-Za-z0-9-_]" (line-beginning-position) t)
          (progn
            (forward-char)
            (setq start (point)))
        (setq start (line-beginning-position))))
    (apply func start end r)
  ))
;; Test case:
;; flip-123dash-underscore[hi-there]
(defun flip-snake-kebab-region (start end)
  (save-excursion
    (let (currently-using-snakecase-p)
      (setq currently-using-snakecase-p
            (progn
              (goto-char start)
              (re-search-forward "_" end t)))
    (if currently-using-snakecase-p
        (replace-string "_" "-" nil start end)
      (replace-string "-" "_" nil start end)))))

(defun flip-snake-kebab ()
  "Toggle between underscore and dash for the symbol at point."
  (interactive)
    (let (start end currently-using-snakecase-p)
      (save-excursion
        ;; Alternate regex:
        ;; (re-search-forward "[\]\[[:space:](){}<>]")
        (if (re-search-forward "[^A-Za-z0-9-_]" (line-end-position) t)
            (progn
              (backward-char)
              (setq end (point)))
          (setq end (line-end-position)))
        (if (re-search-backward "[^A-Za-z0-9-_]" (line-beginning-position) t)
            (progn
              (forward-char)
              (setq start (point)))
          (setq start (line-beginning-position)))
        (setq currently-using-snakecase-p
              (progn
                (goto-char start)
                (re-search-forward "_" end t)))
      (if currently-using-snakecase-p
            (replace-string "_" "-" nil start end)
        (replace-string "-" "_" nil start end)))))

;; (defun trim-diff (s)
;;   (if (string-match "^[+-]" s)
;;       (replace-match "" t t s)
;;     s))

;; (defun kill-diff (beg end)
;;   (interactive "r")
;;   (kill-new (trim-diff (buffer-substring beg end))))

;; From https://emacs.stackexchange.com/questions/36071/magit-copy-text-from-stage-section-without-character
(defun copy-diff-region ()
  (interactive)
  (deactivate-mark)
  (let ((text (buffer-substring-no-properties
               (region-beginning) (region-end))))
    (kill-new (replace-regexp-in-string "^[\\+\\-]" "" text))))
(add-hook 'diff-mode-hook (lambda ()
                            (define-key evil-normal-state-map (kbd "y") 'copy-diff-region)))

(defun flyspell-visible()
  (interactive)
  (flyspell-region (window-start) (window-end)))

;; yasnippet
(defun yas-recompile-and-reload-all ()
  (interactive)
  (yas/recompile-all)
  (yas/reload-all))

;;; packages.el ends here
