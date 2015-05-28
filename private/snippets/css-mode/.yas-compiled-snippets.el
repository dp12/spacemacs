;;; Compiled snippets and support files for `css-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'css-mode
                     '(("background" "background: ${1:transparent} url(\"$2\") ${3:no-repeat} ${4:left} ${5:top};\n" "background: ..." nil nil nil nil nil nil)
                       ("font-face" "@font-face {\n  font-family: '${1:Arial}';\n  src: url('${2:../fonts/Arial-webfont}.eot');\n  src: url('${2:$(yas/substr yas-text \"[^ ]*\")}.eot?#iefix') format('embedded-opentype'),\n       url('${2:$(yas/substr yas-text \"[^ ]*\")}.woff') format('woff'),\n       url('${2:$(yas/substr yas-text \"[^ ]*\")}.ttf') format('truetype'),\n       url('${2:$(yas/substr yas-text \"[^ ]*\")}.svg#${1:$(yas/substr yas-text \"[^ ]*\")}') format('svg');\n  font-weight:${3:normal};\n  font-style:${3:$(yas/substr yas-text \"[^ ]*\")};\n}\n" "@font-face for all the browsers" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu May 28 14:17:45 2015
