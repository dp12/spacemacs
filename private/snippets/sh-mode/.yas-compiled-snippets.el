;;; Compiled snippets and support files for `sh-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'sh-mode
                     '(("f" "function ${1:methodName} {\n    $0\n}\n" "function { ... }" nil nil nil nil nil nil)
                       ("l" "echo \"${1:hello}\"\n" "echo \"hello\"" nil nil nil nil nil nil)
                       ("lo" "echo \"${1:object}=\\$\\{${1:$(yas/substr yas-text \"[^ ]*\")}\\}\"\n" "echo \"object=${object}\"" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu May 28 14:17:45 2015
