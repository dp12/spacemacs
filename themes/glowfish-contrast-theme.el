
(deftheme glowfish-contrast "Glowfish.")

(custom-theme-set-faces
  'glowfish-contrast
  ;; '(default ((t (:family "DejaVu Sans Mono"
  ;;                :foundry "unknown"
  ;;                :width normal
  ;;                :height 113
  ;;                :weight normal
  ;;                :slant normal
  ;;                :underline nil
  ;;                :overline nil
  ;;                :strike-through nil
  ;;                :box nil
  ;;                :inverse-video nil
  ;;                :foreground "#6ea240"
  ;;                :background "#090b07"
  ;;                :stipple nil
  ;;                :inherit nil))))

'(default ((t (:background "#090b07" :foreground "#6ea240"))))
'(cursor ((t (:background "#f8f8f0"))))
'(fixed-pitch ((t (:family "Monospace"))))
'(variable-pitch ((t (:family "Sans Serif"))))
'(escape-glyph ((t (:foreground "brown"))))
'(minibuffer-prompt ((t (:foreground "#95cc5e"))))
'(highlight ((t (:background "#ffe792" :foreground "#000000"))))
'(region ((t (:background "#db784d"
              :foreground "#ffffff"))))
'(shadow ((t (:foreground "#3b3a32"))))
'(linum ((t (:foreground "#67854f"))))
;; '(linum ((t (:foreground "#3c4e2d"))))
'(secondary-selection ((t (:background "#db784d"))))
'(font-lock-builtin-face ((t (:foreground "#95cc5e"))))
'(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
'(font-lock-comment-face ((t (:foreground "#3c4e2d"))))
;; '(font-lock-constant-face ((t (:foreground "#db784d"))))
'(font-lock-constant-face ((t (:foreground "#f8bb39"))))
;; '(font-lock-constant-face ((t (:foreground "#67854f"))))
;; '(font-lock-doc-face ((t (:foreground "#67854f"))))
'(font-lock-doc-face ((t (:foreground "#3c4e2d"))))
'(font-lock-function-name-face ((t (:foreground "#60a365"))))
;; '(font-lock-keyword-face ((t (:foreground "#95cc5e"))))
;; '(font-lock-keyword-face ((t (:foreground "#d65940"))))
'(font-lock-keyword-face ((t (:foreground "#db784d"))))
'(font-lock-negation-char-face ((t nil)))
'(font-lock-preprocessor-face ((t (:foreground "#95cc5e"))))
'(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
'(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
'(font-lock-string-face ((t (:foreground "#f8bb39"))))
;; '(font-lock-type-face ((t (:inherit 'default))))
'(font-lock-type-face ((t (:foreground "#95cc5e"))))
'(font-lock-variable-name-face ((t (:foreground "#95cc5e"))))
'(font-lock-warning-face ((t (:background "#00a8c6" :foreground "#f8f8f0"))))
'(ggtags-highlight ((t (:foreground "#95cc5e"))))
'(company-tooltip ((t (:background "#121212" :foreground "#95cc5e"))))
'(company-tooltip-selection ((t (:background "#f8bb39" :foreground "black"))))
'(company-tooltip-annotation ((t (:foreground "#f8bb39"))))
'(company-tooltip-annotation-selection ((t (:foreground "black"))))
'(button ((t (:inherit (link)))))
'(link ((((class color) (min-colors 88) (background light)) (:underline (:color foreground-color :style line) :foreground "RoyalBlue3")) (((class color) (background light)) (:underline (:color foreground-color :style line) :foreground "blue")) (((class color) (min-colors 88) (background dark)) (:underline (:color foreground-color :style line) :foreground "cyan1")) (((class color) (background dark)) (:underline (:color foreground-color :style line) :foreground "cyan")) (t (:inherit (underline)))))
'(link-visited ((default (:inherit (link))) (((class color) (background light)) (:foreground "magenta4")) (((class color) (background dark)) (:foreground "violet"))))
'(fringe ((((class color) (background light)) (:background "grey95")) (((class color) (background dark)) (:background "grey10")) (t (:background "gray"))))
'(header-line ((default (:inherit (mode-line))) (((type tty)) (:underline (:color foreground-color :style line) :inverse-video nil)) (((class color grayscale) (background light)) (:box nil :foreground "grey20" :background "grey90")) (((class color grayscale) (background dark)) (:box nil :foreground "grey90" :background "grey20")) (((class mono) (background light)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "black" :background "white")) (((class mono) (background dark)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "white" :background "black"))))
'(tooltip ((((class color)) (:inherit (variable-pitch) :foreground "black" :background "lightyellow")) (t (:inherit (variable-pitch)))))
;; '(mode-line ((((class color) (min-colors 88)) (:foreground "black" :background "grey75" :box (:line-width -1 :color nil :style released-button))) (t (:inverse-video t))))
'(mode-line ((((class color) (min-colors 88)) (:foreground "#95cc5e" :background "#3a3a3a" :box (:line-width -1 :color nil :style released-button))) (t (:inverse-video t))))
'(mode-line-buffer-id ((t (:weight bold))))
'(mode-line-emphasis ((t (:weight bold))))
'(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
;; '(mode-line-inactive ((default (:inherit (mode-line))) (((class color) (min-colors 88) (background light)) (:background "grey90" :foreground "grey20" :box (:line-width -1 :color "grey75" :style nil) :weight light)) (((class color) (min-colors 88) (background dark)) (:background "grey30" :foreground "grey80" :box (:line-width -1 :color "grey40" :style nil) :weight light))))
'(mode-line-inactive ((default (:inherit (mode-line))) (((class color) (min-colors 88) (background light)) (:background "#121212" :foreground "grey20" :box (:line-width -1 :color "grey75" :style nil))) (((class color) (min-colors 88) (background dark)) (:background "grey30" :foreground "grey80" :box (:line-width -1 :color "grey40" :style nil)))))
'(isearch ((t (:background "#ffe792" :foreground "#000000"))))
'(isearch-fail ((t (:background "#00a8c6" :foreground "#f8f8f0"))))
'(lazy-highlight ((t (:background "#ffe792" :foreground "#000000"))))
'(match ((t (:background "#ffe792" :foreground "#000000"))))
'(next-error ((t (:inherit (region)))))
'(query-replace ((t (:inherit (isearch)))))
)

;; Add face for operators
(defface font-lock-operator-face '((t :foreground "#d65940")) "Basic face for operators.")
;; (defface font-lock-conditionals-face '((t :foreground "#db784d")) "Basic face for conditionals.")
(defface font-lock-conditionals-face '((t :foreground "#d65940")) "Basic face for conditionals.")
(defface font-lock-doxygen-face '((t :foreground "#67854f")) "Basic face for conditionals.")

(defvar conditionals-regexp (rx bow (or "if" "else" "elif" "switch" "case" "then" "for" "while" "do") eow))
(defvar more-constants-regexp (rx bow (or "TRUE" "FALSE") eow))
(defvar doxygen-regexp (rx bow (or "\param" "\body" "\return" "@param" "@body" "@return") eow))

(add-hook 'c-mode-common-hook (lambda ()
                                (progn
                                (font-lock-add-keywords nil
                                                        '(("[&*=+^%|!~?]\\|->" 0 'font-lock-operator-face)))
                                ;; Highlight more carefully to avoid #include paths
                                (font-lock-add-keywords nil
                                                        '(("[^a-z0-9A-Z*/-]\\([<>/-]\\)[^a-z0-9A-Z*/-]" 0 'font-lock-operator-face)))
                                (font-lock-add-keywords nil `((,more-constants-regexp . 'font-lock-constant-face)))
                                (font-lock-add-keywords nil `((,conditionals-regexp . 'font-lock-conditionals-face)))
                                (font-lock-add-keywords nil `((,doxygen-regexp . 'font-lock-doxygen-face)))
                                )))

;; (defface font-lock-operator-face '((t :foreground "#d65940"))
;;   "Basic face for operators." :group 'basic-faces)

;; (set-face-foreground 'font-lock-operator-face "#D65940")
;; (font-lock-add-keywords 'c++-mode
;;                         '(("\\(~^&\|!<>:=,.\\+*/%-]\\)" 0 'font-lock-operator-face)))
;; (font-lock-add-keywords 'c-mode
;;                         '(("\\(~^&\|!<>:=,.\\+*/%-]\\)" 0 'font-lock-operator-face)))

(provide-theme 'glowfish-contrast)

